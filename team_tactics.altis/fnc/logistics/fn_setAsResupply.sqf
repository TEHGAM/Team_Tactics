/*
	Author: Eightysix

	Description:
	Enables an array of object(s) to be resupply objects

	Syntax:
	<Object(s)> call PO3_fnc_setResupply

	Returns: Nothing
*/
private["_objects"];

_objects= _this;

if(typeName _objects != typeName []) then { _objects = [_objects] };

{
	_x setVariable ["PO3_resupply",true,isServer];
}forEach _objects;

true;