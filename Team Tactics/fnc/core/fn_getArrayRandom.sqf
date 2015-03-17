scriptName "PO3\fnc\arrays\fn_getArrayRandom.sqf";
/*
	Author: Eightysix

	Description:
	Returns a value randomly selected from the provided array

	Syntax:
	_value = <ARRAY> call PO3_fnc_getObjectMarkerType;

	Example:

*/
private ["_id","_element"];

_id = (count _this - 1) min (round random (count _this));

_element = _this select _id;

_element