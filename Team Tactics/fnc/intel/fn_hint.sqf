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
		case "HINT" : { hint parseText format["%1",_message] };
		case "HINTC" : { hintc format["%1",_message] };
		case "HINTS";
		case "HINTSILENT" : { hintsilent parseText format["%1",_message] };
		default { hint parseText format["%1",_message] };
	};
};