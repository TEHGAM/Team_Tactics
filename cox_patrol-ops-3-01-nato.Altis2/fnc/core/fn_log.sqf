/*
	Author: Eightysix
*/
if(isNil "PO3_debug") then { PO3_debug = false };
if(isNil "PO3_debug_log") then { PO3_debug_log = false };

_category	= if(count _this > 0) then { _this select 0 }else{ "Log" };
_text		= if(count _this > 1) then { _this select 1 }else{ _this };
_force		= if(count _this > 2) then { _this select 2 }else{ false };

if(!PO3_debug_log && !_force) exitWith { false };

if(typeName _text != "STRING") then { _text = str(_text) };
_text = format["#PO3 %1 - %2: %3",[diag_frameno,diag_ticktime,time],toUpper _category,_text];
diag_log _text;

if(PO3_debug || _force) then {
	[true,"HINT",_text] call PO3_fnc_hint;
};

true