/*
	Author: Eightysix

	Description:
	For Use on CRV units.

	Syntax:

*/
private["_units"];

_units = _this;

if(typeName _units != typeName []) then { _units = [_units] };

{
	_x addEventHandler ["EpeContactStart",{
		_tractor = _this select 0;
		_crater = _this select 1;
		if (_crater isKindof "CraterLong") then {
			[_crater] spawn PO3_fnc_clearCrater;
		};
	}];
}forEach _units;