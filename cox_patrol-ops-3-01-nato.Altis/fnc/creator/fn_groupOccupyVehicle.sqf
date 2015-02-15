scriptName "PO3\fnc\ai\fn_group_occupyVehicle.sqf";
/*
	Author: RoyEightySix (http://roy86.com.au)

	Description:
		Sets a group in patrol a location. They can search nearby buildings.

	Parameter(s):
		0 : Target Vehicle
			OBJECT - Vehicle
		1 : Group
			GROUP - Group ID
		2 (Optional) : Force
			BOOLEAN - true to skip get-in process

	Example:
		[TANKNAME,_groupID] spawn PO3_fnc_group_occupyVehicle;

	Returns:
		Nil
*/
private["_grp","_position","_list", "_units","_staticWeapons"];

_position = (_this select 0) call PO3_fnc_getPos;
_vehicle = _this select 0;
_grp = switch( toUpper( typeName( _this select 1 ) ) ) do {
	case "GROUP" : { _this select 1 };
	case "OBJECT" : { group driver (_this select 1) };
	default { _this select 1 };
};
_force = if(count _this > 2) then { _this select 2 }else{ false};

if(isNil "_grp") exitWith { ["fnc_Group_occupyVehicle","Undefined Group"] call PO3_fnc_log };

_grp setBehaviour "SAFE";
if(!_force) then {
	{
		_x doMove _position;
	}forEach (units _grp);
	waitUntil{ sleep 1; { _x distance _vehicle > 1 } count (units _grp) > 0 };
}else{
	{
		if( (_vehicle emptyPositions "Driver") > 0 ) then {
			_x assignAsDriver _vehicle;
			_x assignAsDriver _vehicle;
		};
		if( (_vehicle emptyPositions "Gunner") > 0 ) then {
			_x assignAsGunner _vehicle;
			_x assignAsGunner _vehicle;
		};
		if( (_vehicle emptyPositions "Commander") > 0 ) then {
			_x assignAsCommander _vehicle;
			_x moveInCommander _vehicle;
		};
		if( (_vehicle emptyPositions "Cargo") > 0 ) then {
			_x assignAsCargo _vehicle;
			_x moveInCargo _vehicle;
		};
	} forEach (units _grp);
};

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