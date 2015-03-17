private["_lifter","_object"];

_loader = _this select 0;
_object = _loader getVariable ["PO3_loaded",objNull];

if(isNull _object) exitWith { _loader setVariable ["PO3_loaded",objNull,true] };

[true,"HINT",format[ localize "STR_PO3_LOGIST_UNLOADINGOBJECT",[_object] call PO3_fnc_getCfgText,[_loader] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;

sleep 3;

_loader setVariable ["PO3_loaded",objNull,true];
_object setVariable ["PO3_loaded",objNull,true];