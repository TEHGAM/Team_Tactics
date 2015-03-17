private ["_unit","_gearList","_backpack","_isBackpack","_packHolder"];

_unit		= _this select 0;
_gearList	= [_unit,false] call PO3_fnc_getLoadout;
_backpack	= backpack _unit;
_isBackpack	= if(_backpack == "") then { false }else{ !(isNull (unitBackpack _unit)) };

removeHeadgear _unit;
removeBackpack _unit;
_unit addHeadgear (["H_CrewHelmetHeli_B","H_CrewHelmetHeli_O", "H_CrewHelmetHeli_I"] select ([WEST, EAST, RESISTANCE] find (side _unit)));
_unit addBackpack "B_Parachute";

_packHolder = if(_isBackpack) then { createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"] }else{ nil };
if(!isNil "_packHolder") then { _packHolder addBackpackCargoGlobal [_backpack, 1] };

// FREEFALL
waitUntil {animationState _unit == "HaloFreeFall_non" || (getPos _unit select 2) < 1};
if(!isNil "_packHolder") then {
	_packHolder attachTo [_unit,[-0.12,-0.02,-.74],"pelvis"];
	_packHolder setVectorDirAndUp [[0,-1,-0.05],[0,0,-1]];
};

// PARACHUTE
waitUntil {animationState _unit == "para_pilot" || (getPos _unit select 2) < 1};
if(!isNil "_packHolder") then {
	_packHolder attachTo [vehicle _unit,[-0.07,0.67,-0.13],"pelvis"];
	_packHolder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];
};

// LANDED
waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1};
if(!isNil "_packHolder") then { detach _packHolder;
	deleteVehicle _packHolder;
};

if(alive _unit) then {
	[_unit,_gearList] call PO3_fnc_setLoadout;
};