/*
	Author: Eightysix

	Description:
	Sets the environment wind

	Syntax:
	[<number>,<number>] call PO3_fnc_setWind;

	Example:

*/
private["_state","_time"];

_windE = _this select 0;
_WindN = _this select 1;

setWind [_windE, _WindN, true];

["PO3_fnc_setWind",format["Set to %1",[_windE, _WindN] ] ] call PO3_fnc_log;