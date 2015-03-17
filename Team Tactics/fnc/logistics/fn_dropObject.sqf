private["_lifter","_object"];

_dragger = _this select 0;
_object = _dragger getVariable ["PO3_dragged",objNull];

if(isNull _object) exitWith {};

[true,"HINT",format["Releasing %1 from %2",[_object] call PO3_fnc_getCfgText,[_dragger] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;

_dragger setVariable ["PO3_dragged",objNull,true];
_object setVariable ["PO3_dragged",objNull,true];