private["_location","_position","_locaname"];
// =========================================================================================================
//	Define Random Location
// =========================================================================================================

_location = "bay" call PO3_fnc_getNewPos;

PO3_TASK__DIF	= PO3_param_missionskill;
PO3_TASK__POS	= _location select 0;
PO3_TASK__IDD	= format["%1%2:%3",round(PO3_TASK__POS select 0),round(PO3_TASK__POS select 1),(round random 99)];

_position = [PO3_TASK__POS,[1000,4000],400,2,10] call PO3_fnc_getSafePos;
_locaname = _location select 1;
_locRadis = _location select 2;

_depthTest = "Sign_Sphere25cm_F" createVehicle _position;
while { (getPosASL _depthTest select 2) < -5 } do {
	deleteVehicle _depthTest;
	_position = [_position,[10,300],1,2,10] call PO3_fnc_getSafePos;
	_depthTest = "Sign_Sphere25cm_F" createVehicle _position;
};
deleteVehicle _depthTest;

// =========================================================================================================
//	Create Targets
// =========================================================================================================
PO3_TOTAL_UNITS = [];
PO3_TOTAL_VEHICLES = [];

_targetShip = [_position,"C_Boat_Civil_04_F",random 360,0] call PO3_fnc_createVehicle;
_targetShip allowDammage false;
_targetShip setdamage 0;
_targetSmoke = createvehicle ["test_EmptyObjectForFireBig",_position, [],0,"NONE"];
_targetSmoke attachTo [_targetShip, [0,-4,-4]];

_supplyType = PO3_target_cache_types select ([WEST, EAST, RESISTANCE] find (PO3_side_1 select 0));
_supplies = createVehicle [_supplyType,format["return_point_%1",(PO3_side_1 select 0)] call PO3_fnc_getPos,[],0,"NONE"];
clearMagazineCargo _supplies;
clearWeaponCargo _supplies;
clearItemCargo _supplies;
clearBackpackCargo _supplies;
_supplies addItemCargo ["ToolKit", 20];

// =========================================================================================================
//	Create Hostiles
// =========================================================================================================
_b = round(((playersNumber(PO3_side_1 select 0) max 1)*PO3_param_missionskill max 1) * abs(log(( (playersNumber(PO3_side_1 select 0) max 1)/2)/64)));

// Boats
_numBoats = ceil(round(_b/3) max 1);
for "_i" from 1 to _numBoats do {
	_class = [11] call PO3_fnc_getVehicleTypes;
	if(count _class > 0) then {
		_veh = ([ [_position,[200,400],5,2,10] call PO3_fnc_getSafePos,_class call PO3_fnc_getArrayRandom,random 360,10,(PO3_side_3 select 0),"EN_Squad_Divers"] call PO3_fnc_createVehicle) select 0;
		if !(isNil "_veh") then {
			[ _position, _veh, 200 + (random 200)] spawn PO3_fnc_groupPatrolArea;
			PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
			PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
		};
		sleep 1;
	};
};

// Helicopters
for "_i" from 1 to (PO3_TASK__DIF*3) do {
	_class = [7] call PO3_fnc_getVehicleTypes;
	if(count _class > 0) then {
		_veh = ([ _position,_class call PO3_fnc_getArrayRandom,random 360,(750 + random 250),(PO3_side_3 select 0),[],"FLY"] call PO3_fnc_createVehicle) select 0;
		if !(isNil "_veh") then {
			[ _position, _veh, 1000] spawn PO3_fnc_groupPatrolArea;
			PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
			PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
		};
	};
};

// =========================================================================================================
//	Create Tasks
// =========================================================================================================

[ format["TASK%1",PO3_TASK__IDD],
	localize "STR_PO3_M14_TITLE",
	format[localize "STR_PO3_M14_DESCR",PO3_TASK__IDD,(PO3_side_3 select 2),_locaname],
	(PO3_side_1 select 0),
	[format["MRKR%1",PO3_TASK__IDD],PO3_TASK__POS,"mil_unknown",(PO3_side_3 select 0) call PO3_fnc_getUnitMarkerColour,localize "STR_PO3_M14_MSG_1"],
	"assigned",
	(PO3_TASK__POS),
	localize "STR_PO3_M14_MSG_1"
] call PO3_fnc_addTask;

// =========================================================================================================
//	WAIT UNTIL COMPLETE/FAIL
// =========================================================================================================

waitUntil { _supplies distance _targetShip < 10 || damage _supplies > 0.8 || (getPosASL _supplies select 2) <= 0 };

_repaired = nil; if(_supplies distance _targetShip < 10) then { deleteVehicle _supplies; sleep 30; true }else{ false };

detach _targetSmoke;
deleteVehicle _targetSmoke;
if !(isNull _supplies) then { deleteVehicle _supplies };

waitUntil { sleep 3; !(alive _targetSmoke) };

if(_repaired) then {
	[format["TASK%1",PO3_TASK__IDD],"succeeded"] call PO3_fnc_updateTask;
}else{
	[format["TASK%1",PO3_TASK__IDD],"failed"] call PO3_fnc_updateTask;
};

// =========================================================================================================
//	Cleanup
// =========================================================================================================
[_position,PO3_TOTAL_UNITS,PO3_TOTAL_VEHICLES + [_targetShip] ] spawn {
	private["_target","_units","_vehicles"];

	_target = _this select 0;
	_units = _this select 1;
	_vehicles = _this select 2;

	waitUntil { count ([_target,500,(PO3_side_1 select 0),["CAManBase"]] call PO3_fnc_getNearbyPlayers) == 0 };

	{ if(alive _x) then { _x setDamage 1 }; }forEach _units;
	{ if( {isPlayer _x} count (crew _x) == 0 ) then { _x setDamage 1 }; }forEach _vehicles;
};


if(true) exitWith {};