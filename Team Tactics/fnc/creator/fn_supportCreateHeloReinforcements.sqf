private ["_posLanding", "_posInfill", "_side", "_helo", "_cargo","_heliH","_directionSpawn","_chopperWaypoint_1", "_chopperWaypoint_2", "_chopperWaypoint_3","_infantryWaypoint_1"];

_posLanding	= [(_this select 0),[20,150],-1,0,0.1] call PO3_fnc_getSafePos;
_posInfill	= [_posLanding,[2000,3000],random 360,true] call PO3_fnc_getPos;
_side		= _this select 1;
_helo		= _this select 2;
_cargo		= if( toupper(typename (_this select 3)) == "STRING" ) then { (_this select 3) call PO3_fnc_getpreDefinedSquads }else{ _this select 3 };

_heliH = createVehicle ["Land_HelipadEmpty_F", _posLanding, [], 0, "NONE"];

_directionSpawn = [_posInfill, _posLanding] call BIS_fnc_dirTo;
_vehicle = [_posInfill,_helo,_directionSpawn,0,_side,[], "FLY"] call PO3_fnc_createVehicle;
_chopperGroup = _vehicle select 0;
_chopper = _vehicle select 1;
_chopperGroup allowFleeing 0;
_chopperGroup enableAttack false;

_cargogrp = grpNull;
if( count _cargo > 0 ) then {
	_cargogrp = createGroup _side;
	{
		if !(( _chopper emptyPositions "cargo") > 0) exitWith { [format[true,"HINTS","%1 is full and cannot hold any more infantry!",_chopper]] call PO3_fnc_hint };
		_unit = _cargogrp createUnit [_cargo select _ForEachIndex, _posInfill, [], 0, "NONE"];
		_unit setSkill PO3_param_ai_skill;
		_unit allowFleeing 0;
		_unit assignAsCargo _chopper;
		_unit moveInCargo _chopper;
	}forEach _cargo;
};

_chopperWaypoint_1 = _chopperGroup addWaypoint [_posLanding, 0];
_chopperWaypoint_2 = _chopperGroup addWaypoint [_posLanding, 0];
_chopperWaypoint_3 = _chopperGroup addWaypoint [_posInfill, 0];
_chopperWaypoint_1 setWaypointType "MOVE";
_chopperWaypoint_2 setWaypointType "TR UNLOAD";
_chopperWaypoint_3 setWaypointType "MOVE";
_chopperWaypoint_1 setWaypointStatements ["true", "this land 'Get Out';"];
_chopperWaypoint_2 setWaypointStatements ["true", ""];
_chopperWaypoint_3 setWaypointStatements ["true", "_group = group this; _chopper = vehicle this; _units = crew _chopper; { deleteVehicle _x; } forEach _units; deleteVehicle _chopper; deleteGroup _group;"];

_infantryWaypoint_1 = _cargogrp addWaypoint [_posLanding, 0];
_infantryWaypoint_1 setWaypointType "UNLOAD";
_infantryWaypoint_1 setWaypointStatements ["true", "[position this,group this,150] call OCB_fnc_groupPatrolArea;"];

[_chopper,_heliH] spawn { waitUntil { !alive (_this select 0)}; deleteVehicle (_this select 1); };
[_chopperGroup,_chopper,_cargogrp];
