private["_condition","_message","_type","_data"];

_condition	= true;
_type		= "";
_message	= "";

_data = if(typeName _this != typeName []) then { [_this] }else{ _this };

switch (count _data) do {
	case 1 : {
		_condition	= true;
		_type		= "SIDE";
		_message	= _data select 0;
	};
	case 2 : {
		_condition	= _data select 0;
		_type		= "SIDE";
		_message	= _data select 1;
	};
	case 3 : {
		_condition	= _data select 0;
		_type		= _data select 1;
		_message	= _data select 2;
	};
};

if([player,_condition] call PO3_fnc_checkObjCondition) then {
	switch (toUpper _type) do {
		case "GLOBAL" : { player globalChat format["%1",_message] };
		case "COMMAND" : { [side player,"HQ"] commandChat format["%1",_message] };
		case "SIDE" : { [side player,"HQ"] sideChat format["%1",_message] };
		case "GROUP" : { player groupChat format["%1",_message]; };
		default { [side player,"HQ"] sideChat format["%1",_message] };
	};
};