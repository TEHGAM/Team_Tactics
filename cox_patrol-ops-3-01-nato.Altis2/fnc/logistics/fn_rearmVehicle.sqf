private["_vehicle","_vehname","_position","_turretcount","_result"];

_vehicle	= _this select 0;
_vehname	= _this select 1;
_position	= _this select 2;

_turretcount = count (configFile >> "CfgVehicles" >> typeof _vehicle >> "turrets");
_result = false;

if(_turretcount > 0) then {
	private["_turret","_mags_T","_mags_C","_mags_F","_mags_N","_magtype","_diff","_magname"];

	_vehicle setvehicleammo 1;
	_mags_C	= magazines _vehicle;
	_mags_T	= [];
	_mags_F	= [];
	_mags_N	= [];

	{_vehicle removeMagazines _x} foreach magazines _vehicle;

	for "_i" from 1 to _turretcount do {
		_turret	= (configFile >> "CfgVehicles" >> typeof _vehicle >> "turrets") select (_i - 1);
		_mags_T	= _mags_T + getArray(_turret >> "magazines");
	};

	{
		if !(_x in _mags_N) then {
			_mags_N = _mags_N + [_x]
		};
	}foreach _mags_T;

	{
		_magtype = _x;
		_diff = ({_x == _magtype} count _mags_T) - ({_x == _magtype} count _mags_C) + 1;
		for "_j" from 1 to _diff do { _mags_F = _mags_F + [_magtype] };
		_mags_C = _mags_C - [_magtype];
		for "_j" from 1 to (({_x == _magtype} count _mags_T) - _diff) do{ _mags_C = _mags_C + [_magtype] };
	}foreach _mags_N;

	{_vehicle addMagazine _x} foreach _mags_C;

	{
		_magname = getText (configFile >> "CfgMagazines" >> _x >> "displayname");
		if(_magname == "") then {_magname = _x};

		[true,"HINTS",format[localize "STR_PO3_VEHRSUP_REARM",_vehname,_magname]] call PO3_fnc_hint;
		sleep 5;
		if(!alive player || !alive _Vehicle || _vehicle distance _position > 3) exitWith {};
		_vehicle addMagazine _x;

		_result = true;

	}foreach _mags_F;

	if(!alive player || !alive _Vehicle || _vehicle distance _position > 3) exitWith { [true,"HINT",format[localize "STR_PO3_VEHRSUP_STOP",_vehname]] call PO3_fnc_hint };

	_vehicle setVehicleAmmo 1;
};

_result;