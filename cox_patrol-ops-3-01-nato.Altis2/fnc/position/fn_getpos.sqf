/*
	Author: Shuko Modified by Eightysix

	{COMPRESSED}

	Description:
	Do Not Call Directly
*/
private["_getpos"];

_getpos = switch (typename _this) do {
	case "LOCATION" :	{ locationPosition _this };
	case "STRING" :		{ [_this] call PO3_fnc_getPosMarker };
	case "OBJECT" :		{ [_this] call PO3_fnc_getPosarray };
	case "ARRAY" :		{ nil };
	default			{ _this };
};

if(isNil "_getpos") then {
	_getpos = switch (typename (_this select 0)) do {
		case "LOCATION" :	{ locationPosition (_this select 0) };
		case "STRING" :		{ _this call PO3_fnc_getPosMarker };
		case "OBJECT" :		{ _this call PO3_fnc_getPosarray };
		case "ARRAY" :		{ _this call PO3_fnc_getPosarray };
		default			{ _this };
	};
};

_getpos

