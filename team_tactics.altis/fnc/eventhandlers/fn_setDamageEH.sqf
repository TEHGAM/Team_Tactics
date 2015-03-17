/*
	Author: Eightysix

	Description:
	For Use on units that are part of the injury system.

	Syntax:

*/
private["_unit"];

_units = _this;
if(typeName _units != typeName []) then { _units = [_units] };

{
//	_x removeAllEventHandlers "HandleDamage";
//	_x addEventHandler ["HandleDamage",{
//		_this call PO3_fnc_handleInjuryDamage;
//	}];
}forEach _units;