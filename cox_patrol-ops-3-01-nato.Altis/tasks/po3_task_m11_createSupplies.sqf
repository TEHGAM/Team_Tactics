private["_location","_position","_locaname"];
// =========================================================================================================
//	Define Random Location
// =========================================================================================================

_location = "town" call PO3_fnc_getNewPos;

PO3_TASK__DIF	= PO3_param_missionskill;
PO3_TASK__POS	= [ [(_location select 0),0,random 360,false],50,4,5,0.5] call PO3_fnc_getflatarea;
PO3_TASK__IDD	= format["%1%2:%3",round(PO3_TASK__POS select 0),round(PO3_TASK__POS select 1),(round random 99)];

_position = PO3_TASK__POS;
_locaname = _location select 1;
_locRadis = _location select 2;

// =========================================================================================================
//	Create Target(s)
// =========================================================================================================
PO3_TOTAL_UNITS = [];
PO3_TOTAL_VEHICLES = [];

_returnPoint = format["return_point_%1",(PO3_side_1 select 0)] call PO3_fnc_getPos;

_container1 = "Land_Cargo20_military_green_F" createVehicle _returnPoint;
_container2 = "Land_Cargo20_military_green_F" createVehicle _returnPoint;
[ _container1, _container2] call PO3_fnc_setAsLoadable;

PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, _container1];
PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, _container2];

// =========================================================================================================
//	Create Hostiles
// =========================================================================================================

//	_b = 2*(PO3_TASK__DIF*3);
_b = (8*(playersNumber(PO3_side_1 select 0)/40)*PO3_TASK__DIF) max 1;

for "_i" from 1 to _b do {
	_grp = nil;
	_grp = [ _position, (PO3_side_3 select 0), "EN_PatrolGroup0", 20 ] call PO3_fnc_createGroup;
	if !(isNil "_grp") then {
		[ _position, _grp, (100 * _i) ] spawn PO3_fnc_groupPatrolArea;
		PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
		sleep 1;
	};
};

for "_i" from 0 to (_b/2) do {
	if(random 1 > 0.5 || _b >= 8) then {
		_class = [4] call PO3_fnc_getVehicleTypes;
		if(count _class > 0) then {
			_veh = ([ _position,_class call PO3_fnc_getArrayRandom,random 360,100,(PO3_side_3 select 0)] call PO3_fnc_createVehicle) select 0;
			if !(isNil "_veh") then {
				[ _position, _veh, 100 + round(random 300) ] spawn PO3_fnc_groupPatrolArea;
				PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
				PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
			};
		};
	};
};

// =========================================================================================================
//	Create Mines
// =========================================================================================================

_allroads = _position nearRoads 300;
_roads = [];
_allmines = [];

{ if(count roadsconnectedto _x > 1) then { _roads = _roads + [_x]; }; } foreach _allroads;

_roads = _roads call PO3_fnc_arrayShuffle;

if(count _roads > 3) then {
	{
		if(random 1 <= 0.4) then {
			_randompos_on_road = [(getpos _x select 0) + 2.5 - random 5, (getpos _x select 1) + 2.5 - random 5, 0];
			_mine = createMine ["ATMine", _randompos_on_road, [], 0];
			(PO3_side_3 select 0) revealMine _mine;
			PO3_TOTAL_VEHICLES set [count PO3_TOTAL_VEHICLES,_mine];
			_allmines set [count _allmines,_mine];
			if(PO3_debug) then {
				_marker = createmarkerlocal [format["%2%1",_x,random 999],_randompos_on_road];
				_marker setmarkershapelocal "ICON";
				_marker setmarkertypelocal "mil_dot";
				_marker setmarkercolorlocal "ColorRed";
			};
		};
		if( count _allmines >= 9 ) exitWith{};
	} foreach _roads;
};

// =========================================================================================================
//	Create Tasks
// =========================================================================================================

[ format["TASK%1",PO3_TASK__IDD],
	localize "STR_PO3_M11_TITLE",
	format[localize "STR_PO3_M11_DESCR",PO3_TASK__IDD,_locaname],
	(PO3_side_1 select 0),
	[format["MRKR%1",PO3_TASK__IDD],PO3_TASK__POS,"mil_objective",(PO3_side_1 select 0) call PO3_fnc_getUnitMarkerColour,localize "STR_PO3_M11_TITLE"],
	"assigned",
	(PO3_TASK__POS),
	localize "STR_PO3_M11_TITLE"
] call PO3_fnc_addTask;

// =========================================================================================================
//	WAIT UNTIL COMPLETE/FAIL
// =========================================================================================================
waitUntil{ sleep 1;
	{_x distance _position < 300 && isNull(_x getVariable ["PO3_loaded",objNull]) } count [_container1,_container2] > 0 || !(alive _container1 || alive _container2)
};

if(alive _container1 || alive _container2) then {
	_b = round(((playersNumber(PO3_side_1 select 0) max 1)*PO3_param_missionskill max 1) * abs(log(( (playersNumber(PO3_side_1 select 0) max 1)/2)/64)));
	if(random 1 > 0.3 || _b >= 3) then { [_position,(PO3_side_3 select 0),([7] call PO3_fnc_getVehicleTypes) call PO3_fnc_getArrayRandom,format["EN_GroupForce_%1",round random 9]] call PO3_fnc_supportCreateHeloReinforcements; };
	if(random 1 > 0.2 && _b >= 5) then { [_position,(PO3_side_3 select 0),([7] call PO3_fnc_getVehicleTypes) call PO3_fnc_getArrayRandom,format["EN_GroupForce_%1",round random 9]] call PO3_fnc_supportCreateHeloReinforcements; };
	if(random 1 > 0.1 && _b >= 7) then { [_position,(PO3_side_3 select 0),([7] call PO3_fnc_getVehicleTypes) call PO3_fnc_getArrayRandom,format["EN_GroupForce_%1",round random 9]] call PO3_fnc_supportCreateHeloReinforcements; };
};

waitUntil{ sleep 1;
	{_x distance _position < 30 && isNull(_x getVariable ["PO3_loaded",objNull]) } count [_container1,_container2] > 0 || !(alive _container1 || alive _container2)
};

sleep 1;
if (alive _container1 || alive _container2) then {
	[format["TASK%1",PO3_TASK__IDD],"succeeded"] call PO3_fnc_updateTask;
}else{
	[format["TASK%1",PO3_TASK__IDD],"failed"] call PO3_fnc_updateTask;
};

// =========================================================================================================
//	Cleanup
// =========================================================================================================
sleep 2;
{ deleteVehicle _x; }forEach [_container1,_container2];

// =========================================================================================================
//	Cleanup
// =========================================================================================================

[_position,PO3_TOTAL_UNITS,PO3_TOTAL_VEHICLES] spawn {
	private["_target","_units","_vehicles"];

	_target = _this select 0;
	_units = _this select 1;
	_vehicles = _this select 2;

	waitUntil { count ([_target,500,(PO3_side_1 select 0),["CAManBase"]] call PO3_fnc_getNearbyPlayers) == 0 };

	{ if(alive _x) then { _x setDamage 1 }; }forEach _units;
	{ if( {isPlayer _x} count (crew _x) == 0 ) then { _x setDamage 1 }; }forEach _vehicles;
};

if(true) exitWith {};