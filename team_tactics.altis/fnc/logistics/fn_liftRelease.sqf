private["_lifter","_object"];

_lifter = _this select 0;
_object = _lifter getVariable ["PO3_lifted",objNull];

if(isNull _object) exitWith {};

[true,"HINT",format["Releasing %1 from %2",[_object] call PO3_fnc_getCfgText,[_lifter] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;

_lifter setVariable ["PO3_lifted",objNull,true];
_object setVariable ["PO3_lifted",objNull,true];