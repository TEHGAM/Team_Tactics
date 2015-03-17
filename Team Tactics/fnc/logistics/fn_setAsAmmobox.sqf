/*
	Author: Eightysix

	Description:
	Enables an array of object(s) to be ammobox enabled

	Syntax:
	<Object(s)> call PO3_fnc_setAsAmmobox

	Returns: Nothing
*/
private["_objects"];

_objects= _this;

if(typeName _objects != typeName []) then { _objects = [_objects] };

{
	_x setVariable ["PO3_VAS",true,isServer];
}forEach _objects;

true;