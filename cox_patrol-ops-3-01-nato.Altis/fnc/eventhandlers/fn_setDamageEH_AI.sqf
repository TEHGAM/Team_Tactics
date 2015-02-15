/*
	Author: Eightysix

	Description:


	Syntax:

*/
private["_unit"];

if !(PO3_param_ai_easyKill) exitWith {};

_units = _this;
if(typeName _units != typeName []) then { _units = [_units] };

{
	_x removeAllEventHandlers "HandleDamage";
	_x addEventHandler ["HandleDamage",{
		_unit 		= _this select 0;
		_damage = (_this select 2)*2.25;
		_unit setSkill 0.3;
		_damage
	}];
}forEach _units;