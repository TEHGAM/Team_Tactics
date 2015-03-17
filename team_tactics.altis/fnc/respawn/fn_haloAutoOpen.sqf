_unit = _this select 0;

if !(isPlayer _unit) exitWith {};

waitUntil {(getPos _unit select 2) < 150 || animationState _unit == "para_pilot" || (getPos _unit select 2) < 1};

if !(animationState _unit == "para_pilot" && (getPos _unit select 2) > 100) then {
	_unit action ["OpenParachute", _unit];
};