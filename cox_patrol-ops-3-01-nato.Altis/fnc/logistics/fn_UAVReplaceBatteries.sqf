private["_uav","_vehname","_status_d","_status_f"];

_uav = _this select 0;
_uav setDamage 0;
_uav setFuel 1;

_vehname	= [_uav] call PO3_fnc_getCfgText;
_status_d	= damage _uav;
_status_f	= fuel _uav;

[true,"HINT",
	format[
		"<img image='%5' size='2'/><br/>Replaced Batteries on %1<br/><br/>GRID: #%2<br/>Damage: %3<br/>Power: %4",
		_vehname,
		mapGridPosition _uav,
		str(round(_status_d*100))+"%",
		str(round(_status_f*100))+"%",
		[_uav] call PO3_fnc_getCfgPicture
	]
] call PO3_fnc_hint;