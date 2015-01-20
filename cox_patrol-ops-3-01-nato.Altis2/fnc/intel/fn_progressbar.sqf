/*
	Author: Eightysix

	Description:
	Create Chat Command : Local Only
*/
private["_condition","_message","_data"];

_condition	= true;
_message	= "";
_data = if(typeName _this != typeName []) then { [_this] }else{ _this };

switch (count _data) do {
	case 1 : {
		_condition	= true;
		_message	= _data select 0;
	};
	case 2 : {
		_condition	= _data select 0;
		_message	= _data select 1;
	};
};

if([player,_condition] call PO3_fnc_checkObjCondition) then {
	_message spawn PO3_fnc_progressbar_display;
};
