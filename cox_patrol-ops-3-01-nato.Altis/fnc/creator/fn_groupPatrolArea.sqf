scriptName "PO3\fnc\ai\fn_group_patrol.sqf";
/*
	Author: RoyEightySix (http://roy86.com.au)

	Description:
		Sets a group in patrol a location. They can search nearby buildings.

	Parameter(s):
		0 : Position
			STRING - Marker Name
			ARRAY - [x,y,z] co-ordinates
			OBJECT - Vehicle or Unit
		1 : Group
			GROUP - Group ID
		2 (Optional) : Radius
			NUMBER - duration of a simple fade out to black
		3 (Optional) : Search
			BOOLEAN - true to seach neaby houses at waypoints

	Example:
		["Marker1",_GROUP,100] spawn PO3_fnc_group_patrol;

	Returns:
		Nil
*/
private["_grp","_position","_radius","_searchhouses","_occupystatic","_wpcount","_inc","_wparray","_dir","_buildingpos","_house"];

_position = (_this select 0) call PO3_fnc_getPos;
_grp = switch( toUpper( typeName( _this select 1 ) ) ) do {
	case "GROUP" : { _this select 1 };
	case "OBJECT" : { group driver (_this select 1) };
	default {nil};
};
_radius		= if( count _this > 2 ) then { _this select 2 }else{ 20 + (round random 50) };
_searchhouses	= if( count _this > 3 ) then { _this select 3 }else{ false };

if(isNil "_grp") exitWith { ["PO3_fnc_groupPatrolArea","ERROR: Undefined Group"] call PO3_fnc_log };

_wpcount = (round(_radius / 15) max 5) min 25;
_inc = 360/_wpcount;
_wparray = [];
_dir = if(random 1 > 0.5) then { -1 }else{ 1 };

for "_i" from 0 to _wpcount do {

	_ang = _inc * _i * _dir;
	_a = (_position select 0)+(sin(_ang)*_radius);
	_b = (_position select 1)+(cos(_ang)*_radius);

	if(
		vehicle(leader _grp) isKindOf "LAND" && !(surfaceIsWater [_a,_b])
		|| vehicle(leader _grp) isKindOf "SHIP" && surfaceIsWater [_a,_b]
		|| vehicle(leader _grp) isKindOf "AIR"
	) then{
		_wparray set [count _wparray,[_a,_b,0]];
		if(_searchhouses) then {
			_nearhouses = nearestObjects [ [_a,_b],["House"],10];
			if(count _nearhouses > 0) then {
				{
					_house = _x;
					_buildingpos = 0;
					while{count ((_house buildingpos _buildingpos) - [0]) > 0} do {_buildingpos = _buildingpos + 1};
					_buildingpos = _buildingpos - 1;
					if(_buildingpos > 1) exitWith{};
				} foreach _nearhouses;

				if(_buildingpos > 1) then {
					_newwaypointpos = _house buildingpos (round random _buildingpos max 2);
					_wparray set [count _wparray,_newwaypointpos];
				};
			};
		};
	};
};

_wparray = _wparray call PO3_fnc_arrayShuffle;

_wp = nil;
while { {alive _x} count (units _grp) > 0 } do {

	if( behaviour leader _grp != "COMBAT" && isNil "_wp") then {
		{deleteWaypoint _x} foreach waypoints _grp;

		{
			_wp = _grp addWaypoint [_x,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointCompletionRadius 20;
			_wp setWaypointTimeout [0,5,15];

			if(_forEachIndex == 0) then {
				_wp setWaypointSpeed "NORMAL";
				_wp setWaypointBehaviour "SAFE";
				_wp setWaypointFormation "STAG COLUMN";
			};

			if(PO3_debug) then {
				_marker = createMarkerlocal [format["PO3_temp_ap%1",_x],_x];
				_marker setMarkerTypelocal "mil_dot";
				_marker setMarkersizelocal [0.3,0.3];
				_marker setMarkerTextlocal str _forEachIndex;
			};
		} foreach _wparray;
		["PO3_fnc_groupPatrolArea",format["%1 Assigned Patrol WPs %2",_grp,_wparray]] call PO3_fnc_log;

		if!(isNil "_wp") then { _wp setWaypointType "CYCLE" };

	};

	if( behaviour leader _grp == "COMBAT" && !isNil "_wp") then {
		{
			_x stop false;
			_x setUnitPos "AUTO";
		} foreach units _grp;

		_grp setFormation "LINE";

		{
			if(side _x == side leader _grp && not isPlayer leader _x) then {
				group _x setBehaviour "COMBAT";
			};
		} foreach nearestObjects [_position,["Man","LandVehicle","Air"],_radius];

		{deleteWaypoint _x} foreach waypoints _grp;
		_wp = nil;
	};

	sleep 10;
};

{deleteWaypoint _x} foreach waypoints _grp;