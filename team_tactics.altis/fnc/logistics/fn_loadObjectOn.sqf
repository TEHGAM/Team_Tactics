private["_loader","_object","_loadable","_offset","_dimension_max","_direction"];

_loader = _this select 0;
_object = _this select 1;

_loadable = [_loader,_object] call PO3_fnc_isLoadable;
if !(_loadable) exitWith { [true,"HINT",format[ localize "STR_PO3_LOGIST_TOOHEAVY",[_object] call PO3_fnc_getCfgText,[_loader] call PO3_fnc_getCfgText] ] call PO3_fnc_hint; false };

//Make Vehicle Local
if!(local _object) then {
	_local = [_object, player] call PO3_fnc_requestOwnership;
	if(!_local) then { [true,"HINT","Warning: Unable to assign locality to you!"] call PO3_fnc_hint };
};

_offset = [_loader,_object] call PO3_fnc_getLoadOffset;
_direction = switch (true) do {
	case (_object isKindOf "Air");
	case (_object isKindOf "LandVehicle") : { 180 };
	case (_object isKindOf "B_supplyCrate_F");
	case (_object isKindOf "Cargo_base_F") : { 90 };
	default { 0 };
};

_object attachTo [_loader, _offset];
[_object,_direction] call PO3_fnc_change_direction;//_object setDir _direction;

_loader setVariable ["PO3_loaded",_object,true];
_object setVariable ["PO3_loaded",_loader,true];

[true,"HINT",format[ localize "STR_PO3_LOGIST_OBJECTLOADED",[_object] call PO3_fnc_getCfgText,[_loader] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;

waitUntil {
	!(alive _loader) ||
	!(alive _object) ||
	!(canMove _loader) ||
	!(count crew _object == 0) ||
	 ([_loader] call PO3_fnc_isLifted) ||
	 ([_object] call PO3_fnc_isLifted) ||
	!([_loader,_object] call PO3_fnc_isLoaded)
};

detach _object;

_dimension_max = (((boundingBox _object select 1 select 1) max (-(boundingBox _object select 0 select 1))) max ((boundingBox _object select 1 select 0) max (-(boundingBox _object select 0 select 0))));
_object setPos [
	(getPos _loader select 0) - ( (_dimension_max + 1.5 - (boundingBox _loader select 0 select 1) ) * sin(getDir _loader) ),
	(getPos _loader select 1) - ( (_dimension_max + 1.5 - (boundingBox _loader select 0 select 1) ) * cos(getDir _loader) ),
	0
];
_object setVelocity [0, 0, 0];

_loader setVariable ["PO3_loaded",objNull,true];
_object setVariable ["PO3_loaded",objNull,true];

[true,"HINT",format[ localize "STR_PO3_LOGIST_UNLOADEDOBJECT",[_object] call PO3_fnc_getCfgText,[_loader] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;
