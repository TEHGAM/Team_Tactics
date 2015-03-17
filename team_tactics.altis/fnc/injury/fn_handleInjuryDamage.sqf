private ["_unit","_bodypart","_damage","_return"];

_unit 		= _this select 0;
_bodypart	= _this select 1;
_damage		= _this select 2;
_return = _damage / (PO3_param_injury_factor max 1);

//if(_unit getVariable ["PO3_injury_inAgony",false]) exitWith { _return/10 };

_inAgony = _unit getVariable ["PO3_injury_inAgony",false];

if( alive _unit) then {
	_unit setVariable ["PO3_injury_totalDamage",(_unit getVariable ["PO3_injury_totalDamage",0])+_return,false];
	if( _unit getVariable ["PO3_injury_totalDamage",0] >= 0.9 && !(_inAgony)) then {
		[_unit] spawn PO3_fnc_unitInAgony;
		_return = 0;
	};
	if( _unit getVariable ["PO3_injury_totalDamage",0] >= 3.5) then {
		_return = 100;
	};
};

_return