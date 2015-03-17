/*
	Author: Eightysix

	Description:


	Syntax:

*/
private["_units"];

_units = _this;
if(typeName _units != typeName []) then { _units = [_units] };

{
//	_x removeAllEventHandlers "Handleheal";
//	_x addEventHandler ["Handleheal",{
//		_this call PO3_fnc_handleInjuryHeal
//	}];
}forEach _units;