/*
	Author: Eightysix

	Description:
	checks if an object is lifted

	Syntax:
	[<target>] call PO3_fnc_isLifted

	Returns: BOOLEAN
*/
private["_checkObject","_return"];

_checkObject = (_this select 0) getVariable ["PO3_lifted",objNull];

if(isNil "_checkObject") exitWith { false};

_return = if(isNull _checkObject) then { false }else{ true };

_return