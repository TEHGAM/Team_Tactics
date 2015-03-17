scriptName "PO3\fnc\ai\fn_group_moveAlongPath.sqf";
/*
	Author: RoyEightySix (http://roy86.com.au)

	Description:
		Sets a group in move along a path. Units will dismount when attacked and remount afterwards.

	Parameter(s):
		0 : Group
			GROUP - Group ID
		1 : Positions in ARRAY
			STRING - Marker Name
			ARRAY - [x,y,z] co-ordinates
			OBJECT - Vehicle or Unit
		2 (Optional) : Search
			BOOLEAN - true to seach neaby houses at waypoints

	Example:
		[<group>,[<position>,<position>,...] ] spawn PO3_fnc_group_moveAlongPath

	Returns:
		Nil
*/
private["_grp","_positions","_searchhouses","_wpcount","_inc","_wparray","_dir","_buildingpos","_house"];

_grp = switch( toUpper( typeName( _this select 0 ) ) ) do {
	case "GROUP" : { _this select 0 };
	case "OBJECT" : { group driver (_this select 0) };
	default {nil};
};
_positions	= if( count _this > 1 ) then { _this select 1 }else{ nil };
_searchhouses	= if( count _this > 2 ) then { _this select 2 }else{ false };

if(isNil "_positions") exitWith { ["fnc_Group_moveAlongPath","Undefined Positions"] call PO3_fnc_log };
if(isNil "_grp") exitWith { ["fnc_Group_moveAlongPath","Undefined Group"] call PO3_fnc_log };

_wpcount = count _positions;
_wparray = [];

for "_i" from 1 to _wpcount do {

	_position = (_positions select (_i - 1)) call PO3_fnc_getPos;

	_a = _position select 0;
	_b = _position select 1;

	if(not surfaceIsWater [_a,_b]) then{
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

_wp = nil;

while { {alive _x} count (units _grp) > 0 } do {

	if( behaviour leader _grp != "COMBAT" && isNil "_wp") then {
		{deleteWaypoint _x} foreach (waypoints _grp);

		{
			_wp = _grp addWaypoint [_x,0];
			_wp setWaypointBehaviour "SAFE";
			_wp setWaypointFormation "COLUMN";
			_wp setWaypointSpeed "NORMAL";

			if(PO3_debug) then {
				_marker = createMarkerlocal [format["PO3_temp_ap%1",_x],_x];
				_marker setMarkerTypelocal "dot";
				_marker setMarkersizelocal [0.3,0.3];
			};
		} foreach _wparray;
	};

	if( behaviour leader _grp == "COMBAT" && !isNil "_wp") then {
		{
			_x stop false;
			_x setUnitPos "AUTO";
		} foreach (units _grp);

		_grp setFormation "LINE";

		{
			if(side _x == side leader _grp && not isPlayer leader _x) then {
				group _x setBehaviour "COMBAT";
			};
		} foreach (units _grp);
	};

	sleep 10;

};