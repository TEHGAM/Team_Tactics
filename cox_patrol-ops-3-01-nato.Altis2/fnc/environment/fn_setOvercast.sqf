/*
	Author: Eightysix

	Description:
	Sets the Rain

	Syntax:
	[<number>,<number>] call PO3_fnc_setRain;

	Example:

*/
private["_overcast","_time"];

_overcast = _this select 0;
_time = _this select 1;

_time setOvercast _overcast;

["PO3_fnc_setOvercast",format["%1 setOvercast %2",_time,_overcast]] call PO3_fnc_log;
