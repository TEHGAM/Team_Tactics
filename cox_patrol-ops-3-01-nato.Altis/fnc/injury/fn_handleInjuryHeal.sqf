private ["_unit","_bodypart","_damage","_return"];

_injured	= _this select 0;
_healer		= _this select 1;
_isMedic	= _healer call PO3_fnc_isMedic;

_healed = switch (true) do {
	case ( _isMedic && _healer call PO3_fnc_hasMedKit ) : { 0 };
	case ( _isMedic && _healer call PO3_fnc_hasFirstAidKit ) : { 0.25 };
	case ( !(_isMedic) && _healer call PO3_fnc_hasFirstAidKit ) : { 0.5 };
	default { 0.7 };
};

_injured setDamage _healed;

if( alive _injured ) then {
	_injured setVariable ["PO3_injury_totalDamage",_healed,false];
	_injured setVariable ["PO3_injury_healedDamage",_healed,true];
};

true