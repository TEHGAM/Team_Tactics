/*
	AUTHOR: aeroson MODIFIED: Eightysix
	NAME: fn_getloadout.sqf
	VERSION: 3.2

	DOWNLOAD & PARTICIPATE:
	https://github.com/aeroson/get-set-loadout
	http://forums.bistudio.com/showthread.php?148577-GET-SET-Loadout-(saves-and-loads-pretty-much-everything)
*/

private ["_target","_saveLoadout","_currentWeapon","_currentMode","_isFlashlightOn","_isIRLaserOn","_loadedMagazines","_saveWeapon","_getMagsAmmo","_magazinesName","_magazinesAmmo","_backPackItems","_assignedItems","_data"];

_target = _this select 0;
_saveLoadout = if(count _this > 1) then { _this select 1 }else{ false };

_currentWeapon = currentWeapon _target;
_currentMode = "";
_isFlashlightOn = false;
_isIRLaserOn = false;

// save loaded magazines /+ loaded magazines ammo count
_loadedMagazines = [];

// universal weapon saving
_saveWeapon = {
	private ["_weapon","_magazines","_magazine","_muzzles"];
	_weapon = _this select 0;
	_magazines = [];
	if(_weapon != "") then {
		_target selectWeapon _weapon;
		_magazine = currentMagazine _target;
		_magazines = [_magazine];
		_muzzles = configFile>>"CfgWeapons">>_weapon>>"muzzles";
		if(isArray(_muzzles)) then {
			{ // add one mag for each muzzle
				if (_x != "this") then {
					_target selectWeapon _x;
					_magazine = currentMagazine _target;
					_magazines set [count _magazines, _magazine];
				};
			} forEach getArray(_muzzles);
		};
	};
	_loadedMagazines set [count _loadedMagazines, _magazines];
};

[primaryWeapon _target] call _saveWeapon;
[handgunWeapon _target] call _saveWeapon;
[secondaryWeapon _target] call _saveWeapon;

_getMagsAmmo = { // default function with _saveMagsAmmo == false
	_this select 0;
};

// get backpack items
_cargo = getbackpackcargo (unitbackpack _target);
_backpacks = [];
{
	for "_i" from 1 to ((_cargo select 1) select _foreachindex) do {
		_backpacks set [count _backpacks, _x];
	};
} foreach (_cargo select 0);
_backPackItems = (backpackitems _target) + _backpacks;

// get assigned items
_assignedItems = assignedItems _target;
_headgear = headgear _target;
_goggles = goggles _target;
if((_headgear != "") && !(_headgear in _assignedItems)) then {
	_assignedItems set [count _assignedItems, _headgear];
};
if((_goggles != "") && !(_goggles in _assignedItems)) then {
	_assignedItems set [count _assignedItems, _goggles];
};

// get magazines of all assigned items
_magazines = [];
{
	_target selectWeapon _x;
	_magazine = currentMagazine _target;
	if(_magazine != "") then {
		_magazines set[count _magazines, _magazine];
	};
} forEach _assignedItems;
_loadedMagazines set [3, _magazines];

// select back originaly selected weapon and mode
if(vehicle _target == _target) then {
	if(_currentWeapon != "" && _currentMode != "") then {
		_muzzles = 0;
		while{ (_currentWeapon != currentMuzzle _target || _currentMode != currentWeaponMode _target ) && _muzzles < 200 } do {
			_target action ["SWITCHWEAPON", _target, _target, _muzzles];
			_muzzles = _muzzles + 1;
		};
		if(_isFlashlightOn) then {
			_target action ["GunLightOn"];
		};
		if(_isIRLaserOn) then {
			_target action ["IRLaserOn"];
		};
	};
} else {
	_currentMode = "";
};

if(_currentMode == "") then {
	if(_currentWeapon=="") then {
		_target action ["SWITCHWEAPON", _target, _target, 0];
	} else {
		_target selectWeapon _currentWeapon;
	};
};

_data = [
	_assignedItems				//0
	,primaryWeapon _target			//1
	,primaryWeaponItems _target		//2
	,handgunWeapon _target			//3
	,handgunItems _target			//4
	,secondaryWeapon _target		//5
	,secondaryWeaponItems _target		//6
	,uniform _target			//7
	,[uniformItems _target] call _getMagsAmmo	//8
	,vest _target				//9
	,[vestItems _target] call _getMagsAmmo	//10
	,backpack _target			//11
	,[_backPackItems] call _getMagsAmmo	//12
//	,_loadedMagazines			//13 (optional)
//	,_currentWeapon				//14 (optional)
//	,_currentMode				//15 (optional)
];

if(_saveLoadout) then {
	PO3_VAR_savedLoadout = _data;
};

_data;

