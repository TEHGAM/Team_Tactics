private["_target"];

_target = _this select 0;

if(_target == PO3_logistics_SelectedLoadObject) exitWith { [true,"HINT","You cannot load the object on itself!"] call PO3_fnc_hint };

[_target,PO3_logistics_SelectedLoadObject] spawn PO3_fnc_loadObjectOn;

PO3_logistics_SelectedLoadObject = objNull;
PO3_logistics_SelectedLoadObject = nil;