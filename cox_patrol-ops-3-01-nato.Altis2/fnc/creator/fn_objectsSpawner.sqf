if(!PO3SRV && !PO3HLC) exitWith {};

_pos 	= (_this select 0) call PO3_fnc_getPos;
_azi 	= _this select 1;

if(isNil "PO3_compositions" ) then { PO3_compositions = [] };

if(count PO3_compositions == 0 ) exitWith {};

_objs = [];

{
	if( _x select 0 == _this select 2 ) then {
		_objs = _x select 1;
	};
}forEach PO3_compositions;

private ["_posX", "_posY"];
_posX = _pos select 0;
_posY = _pos select 1;
_newObjs = [];

private ["_multiplyMatrixFunc"];

_multiplyMatrixFunc =
{
	private ["_array1", "_array2", "_result"];
	_array1 = _this select 0;
	_array2 = _this select 1;
	_result =
	[
	(((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
	(((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
	];
	_result
};

for "_i" from 0 to ((count _objs) - 1) do {
		private ["_obj", "_type", "_relPos", "_azimuth", "_fuel", "_damage", "_newObj", "_vehicleinit"];
		_obj = _objs select _i;
		_type = _obj select 0;
		_relPos = _obj select 1;
		_azimuth = _obj select 2;
		_fuel = _obj select 3;
		_damage = _obj select 4;
		_vehicleinit = _obj select 5;

		private ["_rotMatrix", "_newRelPos", "_newPos"];
		_rotMatrix =[[cos _azi, sin _azi],[-(sin _azi), cos _azi]];
		_newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;
		private ["_z"];
		if ((count _relPos) > 2) then {_z = _relPos select 2} else {_z = 0};
		_newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];
		_newObj = _type createVehiclelocal _newPos;
		_newObj setDir (_azi + _azimuth);
		_newObj setPos _newPos;
		if (!isNil "_fuel") then {_newObj setFuel _fuel};
		if (!isNil "_damage") then {_newObj setDamage _damage};

		_newObjs = _newObjs + [_newObj];

};