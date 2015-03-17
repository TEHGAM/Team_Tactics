private["_location","_position","_locaname"];
// =========================================================================================================
//	Define Random Location
// =========================================================================================================

_location = "base" call PO3_fnc_getNewPos;

PO3_TASK__DIF	= PO3_param_missionskill;
PO3_TASK__POS	= _location select 0;
PO3_TASK__IDD	= format["%1%2:%3",round(PO3_TASK__POS select 0),round(PO3_TASK__POS select 1),(round random 99)];

_position = [PO3_TASK__POS,[0,10],random 360,false] call PO3_fnc_getPos;
_locaname = _location select 1;
_locRadis = _location select 2;

PO3_TOTAL_UNITS = [];
PO3_TOTAL_VEHICLES = [];
// =========================================================================================================
//	Create Target
// =========================================================================================================

_targetclass = PO3_target_officer_types select ([west,east,resistance] find (PO3_side_3 select 0));
_target_grp = [ _position, (PO3_side_3 select 0), [_targetclass], 10] call PO3_fnc_createGroup;
_target = (units _target_grp) select 0;
[ _target, _target_grp, (5 + random 10), true ] spawn PO3_fnc_groupPatrolArea;
PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + [_target];

// =========================================================================================================
//	Random Events
// =========================================================================================================

if( (random 1) > -0.5 ) then {
	_target setVariable ["PO3_AI_hostile",true,false];
	_target spawn {
		waitUntil {
			if !(alive _this) exitWith {};
			if( (PO3_side_3 select 0) countSide nearestObjects [_this, ["CAManBase"], 100] < 3 ) exitWith {
				_this setVariable ["PO3_capture",true,true];
				_this setVariable ["PO3_AI_hostile",false,false];
				removeAllWeapons _this;
				_this setRank "PRIVATE";
				_this setCaptive true;
			};
			!alive _this;
		};
	};
}else{
	_target setRank "PRIVATE";
	_target setCaptive true;
	_target setVariable ["PO3_capture",true,true];
	_target setVariable ["PO3_AI_hostile",false,false];
	removeAllWeapons _target;
};

// =========================================================================================================
//	Create Hostiles
// =========================================================================================================
_b = round(((playersNumber(PO3_side_1 select 0) max 1)*PO3_param_missionskill max 1) * abs(log(( (playersNumber(PO3_side_1 select 0) max 1)/2)/64)));

// Patroling Hostiles
for "_i" from 1 to (_b/2) do {
	_grp = nil;
	_grp = [ _position, (PO3_side_3 select 0), format["EN_GroupForce_%1",round random 9], 200 ] call PO3_fnc_createGroup;
	if !(isNil "_grp") then {
		[ _position, _grp, 50+(25*_i) ] spawn PO3_fnc_groupPatrolArea;
		PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
		sleep 1;
	};
};
// Defending Hostiles
for "_i" from 1 to (_b/2) do {
	_grp = nil;
	_grp = [ _position, (PO3_side_3 select 0), format["EN_GroupForce_%1",round random 9], 100 ] call PO3_fnc_createGroup;
	if !(isNil "_grp") then {
		[ (leader _grp), _grp ] spawn PO3_fnc_groupDefendPos;
		PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
		sleep 1;
	};
};

_vehClass = [];
if(_b >= 3) then { _vehClass set [count _vehClass,4]; };
if(_b >= 4) then { _vehClass set [count _vehClass,5]; };
if(_b >= 7) then { _vehClass set [count _vehClass,3]; };

for "_i" from 0 to (_b min 9) do {
	if(random 1 > 0.5 || _b >= 8) then {
		_class = _vehClass call PO3_fnc_getVehicleTypes;
		if(count _class > 0) then {
			_veh = ([ _position,_class call PO3_fnc_getArrayRandom,random 360,100,(PO3_side_3 select 0)] call PO3_fnc_createVehicle) select 0;
			if !(isNil "_veh") then {
				[ _position, _veh, 150+(100 *_i) ] spawn PO3_fnc_groupPatrolArea;
				PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
				PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
			};
		};
	};
};

_statics = [_position,4,50,[10] call PO3_fnc_getVehicleTypes,(PO3_side_3 select 0)] call PO3_fnc_createStaticDefense;
if( count _statics > 0 ) then {
	{ PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _x); }forEach _statics;
};

// =========================================================================================================
//	Create Tasks
// =========================================================================================================

[ format["TASK%1",PO3_TASK__IDD],
	format[localize "STR_PO3_M05_TITLE",name _target],
	if!(_target getVariable ["PO3_AI_hostile",false]) then {
		format[localize "STR_PO3_M05_DESCR_01",PO3_TASK__IDD,_locaname,name _target]
	}else{
		format[localize "STR_PO3_M05_DESCR_02",PO3_TASK__IDD,_locaname,name _target]
	},
	(PO3_side_1 select 0),
	[format["MRKR%1",PO3_TASK__IDD],PO3_TASK__POS,"mil_objective",(PO3_side_3 select 0) call PO3_fnc_getUnitMarkerColour,format[localize "STR_PO3_M05_TITLE",name _target]],
	"assigned",
	(PO3_TASK__POS),
	format[localize "STR_PO3_M05_TITLE",name _target]
] call PO3_fnc_addTask;

["PO3",format["Task: %1 %2 Generated at %3","CaptureOfficer",PO3_TASK__IDD,_location],true] spawn PO3_fnc_log;

// =========================================================================================================
//	WAIT UNTIL COMPLETE/FAIL
// =========================================================================================================
_heloFired = false;
waitUntil{ sleep 1;
	if ( !(_heloFired) && ({alive _x} count PO3_TOTAL_UNITS <= (count PO3_TOTAL_UNITS)/2) ) then {
		_heloFired = true;
		if(random 1 > 0.3 || _b >= 3) then { [_position,(PO3_side_3 select 0),([7] call PO3_fnc_getVehicleTypes) call PO3_fnc_getArrayRandom,format["EN_GroupForce_%1",round random 9]] call PO3_fnc_supportCreateHeloReinforcements; };
		if(random 1 > 0.2 && _b >= 5) then { [_position,(PO3_side_3 select 0),([7] call PO3_fnc_getVehicleTypes) call PO3_fnc_getArrayRandom,format["EN_GroupForce_%1",round random 9]] call PO3_fnc_supportCreateHeloReinforcements; };
		if(random 1 > 0.1 && _b >= 7) then { [_position,(PO3_side_3 select 0),([7] call PO3_fnc_getVehicleTypes) call PO3_fnc_getArrayRandom,format["EN_GroupForce_%1",round random 9]] call PO3_fnc_supportCreateHeloReinforcements; };
	};
	!(alive _target) || _target distance (format["return_point_%1",(PO3_side_1 select 0)] call PO3_fnc_getPos) < 10
}; // Players Return Target or is killed in the process

if( _target getVariable ["PO3_AI_hostile",false] && !(alive _target) ) then {
	waitUntil{ sleep 1; count ([_target,10,(PO3_side_1 select 0),["CAManBase"] ] call PO3_fnc_getNearbyPlayers) > 0 }; // Players Validate Kill
};

sleep 1;
if( _target distance (format["return_point_%1",(PO3_side_1 select 0)] call PO3_fnc_getPos) <= 10 || _target getVariable ["PO3_AI_hostile",false] ) then {
	[format["TASK%1",PO3_TASK__IDD],"succeeded"] call PO3_fnc_updateTask;
}else{
	[format["TASK%1",PO3_TASK__IDD],"failed"] call PO3_fnc_updateTask;
};

// =========================================================================================================
//	Cleanup
// =========================================================================================================

_target action ["eject",vehicle _target];

sleep 2;
deleteVehicle _target;
deleteGroup _target_grp;

[PO3_TASK__POS,PO3_TOTAL_UNITS,PO3_TOTAL_VEHICLES] spawn {
	private["_target","_units","_vehicles"];

	_target = _this select 0;
	_units = _this select 1;
	_vehicles = _this select 2;

	waitUntil { count ([_target,500,(PO3_side_1 select 0),["CAManBase"]] call PO3_fnc_getNearbyPlayers) == 0 };

	{ if(alive _x) then { _x setDamage 1 }; }forEach _units;
	{ if( {isPlayer _x} count (crew _x) == 0 ) then { _x setDamage 1 }; }forEach _vehicles;
};

if(true) exitWith {};