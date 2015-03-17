private["_position","_pos","_numberOfPos","_radius","_side","_staticTypes","_staticPositions","_poscount","_inc","_i","_ang","_r","_a","_b","_staticpos","_statics","_veh","_marker"];

_position	= (_this select 0) call PO3_fnc_getPos;
_numberOfPos	= if(count _this > 1) then { _this select 1 }else{ 3 };
_radius		= if(count _this > 2) then { _this select 2 }else{ 50 };
_staticTypes	= if(count _this > 3) then { if(typename (_this select 3) != "ARRAY") then { [_this select 3] }else{ _this select 3 } }else{ [] };
_side		= if(count _this > 3) then { _this select 4 }else{ nil };

if(count _staticTypes <= 0 || _numberOfPos <= 0 ) exitWith { ["Static Defense Array Empty"] call PO3_fnc_hint };

_staticPositions = [];
_poscount = round (_radius / 15) max 5;
_inc = 360/_poscount;
_road = objNull;
_offset = [0,0,0];

for "_i" from 1 to _numberOfPos	do {
	_ang = _inc * _i;
	_r = (_radius - 20) + round( random 20 );
	_a = (_position select 0) + ( sin(_ang) * _r );
	_b = (_position select 1) + ( cos(_ang) * _r );
	_pos = [_a,_b,0];

	if( count(_pos nearRoads 10) > 0) then {
		_road = (_pos nearRoads 10) select 0;
		_offset = if(random 2 > 1) then { [-7.5 - random 3,0,0] } else { [7.5 + random 3,0,0] };
		_pos = (_road modelToWorld _offset);
	};
	_staticpos = [_pos,_ang];

	if(!surfaceIsWater (_staticpos select 0)) then {
		_staticPositions set [count _staticPositions, _staticpos];
	};
};

_statics = [];
{

	_veh = if !(isNil "_side") then {
		([ _x select 0, _staticTypes call PO3_fnc_getArrayRandom, _x select 1, 0, _side] call PO3_fnc_vehicleSpawner) select 1;
	}else{
		([ _x select 0, _staticTypes call PO3_fnc_getArrayRandom, _x select 1, 0] call PO3_fnc_vehicleSpawner) select 0;
	};
	_statics set [count _statics,_veh];
	_veh setDir (_x select 1);

	if(PO3_debug) then {
		_marker = createMarkerlocal [format["PO3_temp_static%1",_x select 1],_x select 0];
		_marker setMarkerTypeLocal (_veh call PO3_fnc_getObjectMarkerType);
		_marker setMarkerColorLocal (_veh call PO3_fnc_getUnitMarkerColour);
		_marker setMarkersizelocal [0.3,0.3];
		_marker setMarkerTextlocal str (_x select 1);
	};
}forEach _staticPositions;

["PO3_fnc_createStaticDefense",format["Static Defense Groups Created at %1, Types: %2",_position,_statics] ] call PO3_fnc_log;

_statics