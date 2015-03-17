private ["_side","_ammobox"];

_side = _this select 0;
if !([player,_side] call PO3_fnc_checkObjCondition) exitWith {};

_ammobox = _this select 2;

clearMagazineCargo _ammobox;
clearWeaponCargo _ammobox;
clearItemCargo _ammobox;
clearBackpackCargo _ammobox;

[_ammobox] spawn PO3_fnc_fillSupplybox;