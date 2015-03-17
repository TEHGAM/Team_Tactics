private["_vehicle","_vehname","_position","_damage","_countdamage","_return","_i"];

_vehicle	= _this select 0;
_vehname	= _this select 1;
_position	= _this select 2;
_damage		= damage _vehicle;

_return = if(_damage > 0) then {
	_countdamage = round(_damage*100) max 0.01;
	for "_i" from 0 to _countdamage do {
		[true,"HINT",format[localize "STR_PO3_VEHRSUP_REPAIR",_vehname,str( round( (_i/_countdamage)*100) ) + "%"] ] call PO3_fnc_hint;
		sleep 2;
		if(!alive player || !alive _Vehicle || _vehicle distance _position > 3) exitWith {};
	};

	if(!alive player || !alive _Vehicle || _vehicle distance _position > 3) exitWith { [true,"HINT",format[localize "STR_PO3_VEHRSUP_STOP",_vehname]] call PO3_fnc_hint; false };
	_Vehicle setDamage 0;
	true
}else{
	false
};

_return;