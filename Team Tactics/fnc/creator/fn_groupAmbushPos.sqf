scriptName "PO3\fnc\ai\fn_group_ambush.sqf";
/*
	Author: Community & Eightysix

	Description:
	Sets a group in wait at a location

	Syntax:
	[<position>,<group>] spawn PO3_fnc_group_ambush

		position - Array, String, Object
		group - Group ID

	Returns: Nil
*/
private["_grp","_position","_list", "_units","_staticWeapons"];

_position = (_this select 0) call PO3_fnc_getPos;
_grp = switch( toUpper( typeName( _this select 1 ) ) ) do {
	case "GROUP" : { _this select 1 };
	case "OBJECT" : { group driver (_this select 1) };
	default {nil};
};

if(isNil "_grp") exitWith { ["fnc_Group_ambush","Undefined Group"] call PO3_fnc_log };

_grp setBehaviour "SAFE";

_list = _pos nearObjects ["StaticWeapon", 100];
_units = (units _grp) - [leader _grp];
_staticWeapons = [];

{
	if ((_x emptyPositions "gunner") > 0) then {
		_staticWeapons = _staticWeapons + [_x];
	};
} forEach _list;

{
	if ((count _units) > 0) then {
		if ((random 1) > 0.2) then {
			private ["_unit"];
			_unit = (_units select ((count _units) - 1));
			_unit assignAsGunner _x;
			[_unit] orderGetIn true;
			_units resize ((count _units) - 1);
		};
	};
} forEach _staticWeapons;

private ["_wp"];
_wp = _grp addWaypoint [_pos, 10];
_wp setWaypointType "GUARD";

private ["_handle"];
_handle = _units spawn
{
	sleep 5;
	{
		if ((random 1) > 0.4) then {
			doStop _x;
			sleep 0.5;
			_x action ["SitDown", _x];
		};
	} forEach _this;
};