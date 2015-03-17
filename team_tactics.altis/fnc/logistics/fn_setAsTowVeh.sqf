/*
	Author: Eightysix

	Description:
	Enables an array of object(s) to be tow vehicle

	Syntax:
	<Object(s)> call PO3_fnc_setTowable

	Returns: Nothing
*/
private["_objects"];

_objects = _this;

if(typeName _objects != typeName []) then { _objects = [_objects] };

{
	_x setVariable ["PO3_towable",true,isServer];
	_x setVariable ["PO3_isTowingObj",objNull,isServer];
}forEach _objects;

true;