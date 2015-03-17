private["_vehicle","_vehname","_position","_fuel","_countfuel","_return","_i"];

_vehicle	= _this select 0;
_vehname	= _this select 1;
_position	= _this select 2;
_existing	= _this select 3;

_Vehicle setfuel _existing;

_return = if(_existing < 1) then {
	while{ fuel _vehicle < 1 } do {
		[true,"HINT",format[localize "STR_PO3_VEHRSUP_REFUEL",_vehname,str( round( (fuel _vehicle)*100) ) + "%"] ] call PO3_fnc_hint;
		_Vehicle setfuel (fuel _vehicle + 0.01);
		sleep 0.1;
		if(!alive player || !alive _Vehicle || _vehicle distance _position > 3) exitWith {};
	};

	if(!alive player || !alive _Vehicle || _vehicle distance _position > 3) exitWith { [true,"HINT",format[localize "STR_PO3_VEHRSUP_STOP",_vehname]] call PO3_fnc_hint; false };
	_Vehicle setfuel 1;
	true
}else{
	false
};

_return;