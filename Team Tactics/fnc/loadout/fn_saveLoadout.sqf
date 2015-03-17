_unit = _this select 0;

if!(_unit isKindof "Man") exitWith {};

[_unit,true] call PO3_fnc_getLoadout;

[true,"HINT","Your loadout and gear have been saved"] call PO3_fnc_hint;
[true,"GLOBAL","Your loadout and gear have been saved"] call PO3_fnc_chat;