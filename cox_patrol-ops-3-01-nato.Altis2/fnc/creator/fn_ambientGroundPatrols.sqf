// Written by EightySix
if(!PO3SRV || !isNil "PO3_VAR_ambientGroundPatrols_active") exitWith{};
PO3_VAR_ambientGroundPatrols_active = true;

_cacheRadius = PO3_radius_ambientpatrolgnd;
_cacheLimit = PO3_count_ambientpatrolgnd;

waitUntil { !isNil "PO3_pos_allowed" };

_positions = [];
{
	for "_i" from 0 to 4 do {
		_pos = [(_x select 0),[100,1000],random 360,false] call PO3_fnc_getPos;
		if !(surfaceIsWater _pos) then{
			_positions set [count _positions,_pos];
		};
	};
} foreach ( (PO3_pos_allowed select 0) /*BASES*/ + (PO3_pos_allowed select 3) /*TOWNS*/ + (PO3_pos_allowed select 5) /*POI*/ + (PO3_pos_allowed select 7) /*OTHER*/ );

_PO3_CACHE_AMBIENTGROUNDPATROLS = [];
for "_i" from 0 to _cacheLimit do {
	_entity = [count _PO3_CACHE_AMBIENTGROUNDPATROLS];
	_entity set [1,false]; // Active Flag
	_entity set [2,_positions call PO3_fnc_getArrayRandom]; // Current Position
	_entity set [3,_positions call PO3_fnc_getArrayRandom]; // Destination Position
	_entity set [4, // Entity Type
		if(random 1 > 0.5) then {
			"VEH"
		}else{
			"INF"
		}
	];
	_entity set [5,
		if( (_entity select 4) IN ["VEH"] ) then {
			([3,4,5] call PO3_fnc_getVehicleTypes) call PO3_fnc_getArrayRandom
		}else{
			format["EN_PatrolGroup%1",round random 2]
		}
	]; // Entity Class
	_entity set [6,grpNull]; // Current Group
	_PO3_CACHE_AMBIENTGROUNDPATROLS set [count _PO3_CACHE_AMBIENTGROUNDPATROLS,_entity];
	["Entity Cache",format["Created Entity %1 Data: %2",_entity select 0,_entity] ] call PO3_fnc_log;

	if(PO3_debug) then {
		_marker = createMarkerlocal [format["PO3Entity%1",_i],_entity select 2 ];
		_marker setMarkerShapelocal "ICON";
		if(_entity select 4 == "VEH") then {_marker setMarkerTypelocal "o_motor_inf"}else{_marker setMarkerTypelocal "o_inf"};
		_marker setMarkerColorlocal "ColorOPFOR";
		_marker setMarkerSizeLocal [1,1];
		_marker setMarkerTextLocal format["%1",_i];
	};
};

_updateCachePos = {
	_orgPos = _this select 0;
	_desPos = _this select 1;
	_type = _this select 2;
	_water = false;
	_speed = switch(_type) do {
		case "INF" : { 2 };
		case "VEH" : { 27 };
		case "BOT" : { _water = true; 11 };
		case "HEL" : { 44 };
		case "PLN" : { _water = true; 55 };
		default { 5 };
	};
	_dir = [_orgPos, _desPos] call BIS_fnc_dirTo;
	_return = [_orgPos,_speed,_dir,_water] call PO3_fnc_getPos;
	_return;
};

_basePosi = [
	("respawn_west" call PO3_fnc_getPos),
	("respawn_east" call PO3_fnc_getPos),
	("respawn_resistance" call PO3_fnc_getPos),
	("respawn_guerilla" call PO3_fnc_getPos)
];

_entityAssignWaypoint = {
	{deleteWaypoint _x} foreach waypoints (_this select 0);
	_wp = (_this select 0) addWaypoint [_this select 1,0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 20;
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointFormation "STAG COLUMN";
};

waitUntil {
	sleep 1;
	{
		_entity = _x;
		_entityID = _entity select 0;
		_position = _entity select 2;
		_destination = _entity select 3;
		_type = _entity select 4;
		_class = _entity select 5;
		_groupID = _entity select 6;
		if(_entity select 1) then {
			// Update Entities Position
			_entity set [2,position leader _groupID];
			if(
				count ([(_entity select 2),_cacheRadius,[west,east,resistance],["CAManBase","LandVehicle","Helicopter"] ] call PO3_fnc_getNearbyPlayers) == 0
			) then {
				// Deactivate
				{deleteWaypoint _x} foreach waypoints (_groupID);
				{ deleteVehicle vehicle _x; deleteVehicle _x; }foreach (units _groupID);
				deleteGroup _groupID;
				_entity set [1,false];
				_entity set [6,grpNull];
				["Entity Cache",format["Deactivated Entity: %1 Data: %2",_entityID,_entity] ] call PO3_fnc_log;
			}else{
				// If all dead, spawn in another position
				if( {alive _x} count (units _groupID) <= 0 ) then {
					_entity set [2,_positions call PO3_fnc_getArrayRandom];
				};
				// Set New Waypoint if they reach current destination
				if( (_entity select 2) distance _destination < 100) then {
					_newDestination = _positions call PO3_fnc_getArrayRandom;
					[_groupID,_newDestination] spawn _entityAssignWaypoint;
					_entity set [3,_newDestination];
					["Entity Cache",format["Active Entity %1 reached desitination. New Destination assigned. Data: %2",_entityID,_entity] ] call PO3_fnc_log;
				};
			};
		}else{
			if( count ([_position,_cacheRadius,[west,east,resistance],["CAManBase","LandVehicle","Helicopter"] ] call PO3_fnc_getNearbyPlayers) > 0
				&& { (_entity select 2) distance _x < _cacheRadius*2} count _basePosi == 0
			) then {
				// Activate
				_groupID = if( _type == "INF" ) then {
					[ _position, (PO3_side_3 select 0),_class] call PO3_fnc_createGroup;
				}else{
					([ _position, _class,0,0, (PO3_side_3 select 0)] call PO3_fnc_createVehicle) select 0;
				};
				[_groupID,_destination] spawn _entityAssignWaypoint;
				_entity set [1,true];
				_entity set [6,_groupID];
				["Entity Cache",format["Activated Entity: %1 Data: %2",_entityID,_entity] ] call PO3_fnc_log;
			}else{
				// Update Position
				_newPos = [(_entity select 2),(_entity select 3),(_entity select 4)] call _updateCachePos;
				_entity set [2,_newPos];
				if( (_entity select 2) distance _destination < 100) then {
					_newDestination = _positions call PO3_fnc_getArrayRandom;
					_entity set [3,_newDestination];
					["Entity Cache",format["Inactive Entity %1 reached desitination. New Destination assigned. Data: %2",_entityID,_entity] ] call PO3_fnc_log;
				};
			};
		};
		_PO3_CACHE_AMBIENTGROUNDPATROLS set [_entityID,_entity];
		format["PO3Entity%1",_forEachIndex] setMarkerPosLocal _position;
	}forEach _PO3_CACHE_AMBIENTGROUNDPATROLS;
	false;
};
