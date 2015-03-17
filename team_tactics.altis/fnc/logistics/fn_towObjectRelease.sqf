private["_towVeh","_object"];

_towVeh = _this select 0;
_object = _towVeh getVariable ["PO3_isTowingObj",objNull];

if(isNull _object) exitWith {};

[true,"HINT",format["Releasing %1 from %2",[_object] call PO3_fnc_getCfgText,[_towVeh] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;

_towVeh setVariable ["PO3_isTowingObj",objNull,true];
_object setVariable ["PO3_isTowingObj",objNull,true];