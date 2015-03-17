/*
	Author: Eightysix

	Description:
	Enables an array of object(s) to be dragable

	Syntax:
	<Object(s)> call PO3_fnc_setDragable

	Returns: Nothing
*/
private["_objects"];

_CRVs = _this;

if(typeName _CRVs != typeName []) then { _CRVs = [_CRVs] };

_CRVs spawn PO3_fnc_setAsTowVeh;
_CRVs spawn PO3_fnc_setContactStartEH_CRV;

true;