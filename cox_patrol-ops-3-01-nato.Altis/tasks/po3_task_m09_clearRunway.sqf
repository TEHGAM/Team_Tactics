private["_location","_position","_locaname"];
// =========================================================================================================
//	Define Random Location
// =========================================================================================================

_location = "airport" call PO3_fnc_getNewPos;

PO3_TASK__DIF	= PO3_param_missionskill;
PO3_TASK__POS	= _location select 0;
PO3_TASK__IDD	= format["%1%2:%3",round(PO3_TASK__POS select 0),round(PO3_TASK__POS select 1),(round random 99)];

_position = [PO3_TASK__POS,[0,(500*PO3_TASK__DIF)],random 360,false] call PO3_fnc_getPos;
_locaname = _location select 1;
_locRadis = _location select 2;

// =========================================================================================================
//	Create Mines
// =========================================================================================================
PO3_TOTAL_UNITS = [];
PO3_TOTAL_VEHICLES = [];

_allroads = _position nearRoads 300;
_roads = [];
_craters = [];

{ if(count roadsconnectedto _x < 1) then { _roads = _roads + [_x]; }; } foreach _allroads;

_roads = _roads call PO3_fnc_arrayShuffle;

_checkRoads = false;
{
	_createtype = ["CraterLong", "CraterLong_small"] call PO3_fnc_getArrayRandom;
	_randompos_on_road = [(getpos _x select 0) + 2.5 - random 5, (getpos _x select 1) + 2.5 - random 5, 0];
	_mine = createVehicle [_createtype,_randompos_on_road,[],0,"CAN_COLLIDE"];
	_craters = _craters + [_mine];
	if( count _craters >= 30*PO3_TASK__DIF ) exitWith{};
} foreach _roads;
_checkRoads = true;

{
	if(PO3_debug) then {
		_marker = createmarkerlocal [format["%2%1",_x,random 999],(_x call PO3_fnc_getPos)];
		_marker setmarkershapelocal "ICON";
		_marker setmarkertypelocal "mil_dot";
		_marker setmarkercolorlocal "ColorRed";
	};
}forEach _craters;

PO3_TOTAL_VEHICLES = PO3_TOTAL_VEHICLES + _craters;

// =========================================================================================================
//	Create Hostiles - Guards
// =========================================================================================================

for "_i" from 1 to 2 do {
	_grp = nil;
	_grp = [ _position, (PO3_side_3 select 0), "EN_PatrolGroup0", 20 ] call PO3_fnc_createGroup;
	if !(isNil "_grp") then {
		[ _position, _grp ] spawn PO3_fnc_groupDefendPos;
		PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
		sleep 1;
	};
};

// =========================================================================================================
//	Create Tasks
// =========================================================================================================

[ format["TASK%1",PO3_TASK__IDD],
	localize "STR_PO3_M09_TITLE",
	format[localize "STR_PO3_M09_DESCR",PO3_TASK__IDD,(PO3_side_3 select 2),count _craters],
	(PO3_side_1 select 0),
	[format["MRKR%1",PO3_TASK__IDD],PO3_TASK__POS,"mil_unknown",(PO3_side_3 select 0) call PO3_fnc_getUnitMarkerColour,localize "STR_PO3_M09_TITLE"],
	"assigned",
	(PO3_TASK__POS),
	localize "STR_PO3_M09_TITLE"
] call PO3_fnc_addTask;

["PO3",format["Task: %1 %2 Generated at %3","ClearMinefield",PO3_TASK__IDD,_location],true] spawn PO3_fnc_log;

waitUntil{ sleep 1; count ([_position,300,(PO3_side_1 select 0),["CAManBase","LandVehicle"] ] call PO3_fnc_getNearbyUnits) > 0 };

// =========================================================================================================
//	Create Hostiles
// =========================================================================================================

_b = round(((playersNumber(PO3_side_1 select 0) max 1)*PO3_param_missionskill max 1) * abs(log(( (playersNumber(PO3_side_1 select 0) max 1)/2)/64)));

for "_i" from 1 to _b do {
	_ingress = [_position ,[400,500],random 360,false] call PO3_fnc_getPos;
	_grp = nil;
	_grp = [ _ingress, (PO3_side_3 select 0), format["EN_GroupForce_%1",round random 9], 50 ] call PO3_fnc_createGroup;
	if !(isNil "_grp") then {
		[ _position, _grp ] spawn PO3_fnc_groupAttackPos;
		PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
		sleep 1;
	};
};

_vehClass = [];
if(_b >= 3) then { _vehClass set [count _vehClass,4]; };
if(_b >= 4) then { _vehClass set [count _vehClass,5]; };
if(_b >= 7) then { _vehClass set [count _vehClass,3]; };

for "_i" from 0 to (_b/2) do {
	if(random 1 > 0.5 || _b >= 8) then {
		_class = _vehClass call PO3_fnc_getVehicleTypes;
		if(count _class > 0) then {
			_ingress = [_position ,[400,500],random 360,false] call PO3_fnc_getPos;
			_veh = ([ _ingress,_class call PO3_fnc_getArrayRandom,random 360,100,(PO3_side_3 select 0)] call PO3_fnc_createVehicle) select 0;
			if !(isNil "_veh") then {
				[ _position, _veh, 100 + round(random 300) ] spawn PO3_fnc_groupPatrolArea;
				PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
				PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
			};
		};
	};
};

// =========================================================================================================
//	WAIT UNTIL COMPLETE/FAIL
// =========================================================================================================

waitUntil {
	sleep 5;
	{ !(isNull _x) } count _craters == 0
};

sleep 1;
if( { !(isNull _x) } count _craters == 0 ) then {
	[format["TASK%1",PO3_TASK__IDD],"succeeded"] call PO3_fnc_updateTask;
}else{
	[format["TASK%1",PO3_TASK__IDD],"failed"] call PO3_fnc_updateTask;
};

// =========================================================================================================
//	Cleanup
// =========================================================================================================

[PO3_TASK__POS,PO3_TOTAL_UNITS,PO3_TOTAL_VEHICLES] spawn {
	private["_target","_units","_vehicles"];

	_target = _this select 0;
	_units = _this select 1;
	_vehicles = _this select 2;

	waitUntil { count ([_target,500,(PO3_side_1 select 0),["CAManBase","LandVehicle"]] call PO3_fnc_getNearbyPlayers) == 0 };

	{ if(alive _x) then { _x setDamage 1 }; }forEach _units;
	{ if( {isPlayer _x} count (crew _x) == 0 ) then { _x setDamage 1 }; }forEach _vehicles;
};

if(true) exitWith {};