/*
	Author: Eightysix

	Description:


	Syntax:


	Example:

*/
private["_fog","_time"];

_fog = _this select 0;
_time = _this select 1;

_time setFog _fog;

["PO3_fnc_setFog",format["%1 setFog %2",_time,_fog]] call PO3_fnc_log;
