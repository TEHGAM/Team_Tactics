scriptName "PO3\fnc\ai\fn_setGroupDefend.sqf";
/*
	Author: RoyEightySix (http://roy86.com.au)

	Description:
		Sets a group in occupy and defend a location. They can occupy nearby static weapons and buildings.

	Parameter(s):
		0 : Position
			STRING - Marker Name
			ARRAY - [x,y,z] co-ordinates
			OBJECT - Vehicle or Unit
		1 : Group
			GROUP - Group ID
		2 (Optional) : Radius
			NUMBER - search radius for static weapons and buildings

	Example:
		["Marker1",_GROUP,100] spawn PO3_fnc_setGroupDefend;

	Returns:
		Nil
*/
private["_grp","_position","_list", "_units","_staticWeapons","_wp","_side","_nearByBuildings"];

_position = (_this select 0) call PO3_fnc_getPos;
_grp = switch( toUpper( typeName( _this select 1 ) ) ) do {
	case "GROUP" : { _this select 1 };
	case "OBJECT" : { group driver (_this select 1) };
	default {nil};
};
_radius = if(count _this > 2) then { _this select 2 }else{ 100 };

if(isNil "_grp") exitWith { ["PO3_fnc_groupPatrolArea","ERROR: Undefined Group"] call PO3_fnc_log; };

_grp setBehaviour "SAFE";
_side = side _grp;

_list = _position nearObjects ["StaticWeapon", 200];
_units = (units _grp) - [leader _grp];
_staticWeapons = [];

if(count _list > 0 ) then {
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
};

_nearByBuildings = [_position,_radius] call PO3_fnc_getNearbyBuildings;
_defendBuildingCount = 0;
if( count _nearByBuildings > 0 ) then {
	{
		_building = _x;
		for "_i" from 0 to 100 do {
			_bpos = _building buildingPos _i;
			if( str _bpos == "[0,0,0]") exitWith {};
			if ( random 1 > 0.7 ) then	{
				if (count (nearestObjects [_bpos, ["CaManBase"], 1]) < 1 && count _units > 0) then {
					_unit = (_units select ((count _units) - 1));
					_units resize ((count _units) - 1);

					_movegroup = creategroup _side;
					[_unit] joinSilent _movegroup;
					_unit doMove _bpos;
					_unit setBehaviour "SAFE";
					_unit setUnitPos "UP";
					_unit setpos _bpos;
					_unit setpos _bpos;
					_movegroup setFormDir (round(random 360));
					_defendBuildingCount = _defendBuildingCount + 1;
				};
			};
		};
	}forEach _nearByBuildings;
};

_wp = _grp addWaypoint [_position, 10];
_wp setWaypointType "GUARD";

["PO3_fnc_groupPatrolArea",format["%1 assigned to defend %2, Static Defenses: %3, Buildings: %4",_grp,_position,count _staticWeapons,_defendBuildingCount]] call PO3_fnc_log;

_units spawn {
	sleep 5;
	{
		if ((random 1) > 0.4) then {
			doStop _x;
			sleep 0.5;
			_x action ["SitDown", _x];
		};
	} forEach _this;
};