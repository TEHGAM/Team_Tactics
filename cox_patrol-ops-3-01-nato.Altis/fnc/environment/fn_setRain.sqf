/*
	Author: Eightysix

	Description:
	Sets the Rain

	Syntax:
	[<number>,<number>] call PO3_fnc_setRain;

	Example:

*/
private["_state","_time"];

_state = _this select 0;
_time = _this select 1;

_time setRain _state;

["PO3_fnc_setRain",format["%1 setRain %2",_time,_state]] call PO3_fnc_log;