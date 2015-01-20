/*
	Author: Eightysix

	Description:

*/
if(PO3_a3 && !alive player) exitWith {};

private ["_player","_killer","_sitrep"];

disableserialization;

_player = _this select 0;
_killer = _this select 1;

_sitrep = "SITREP %1||";
if (name _player != "Error: No unit") then {
	_sitrep = _sitrep + "KIA: %4. %5|";
};

_sitrep = _sitrep + "TOD: %2 %3|LOC: %6 \ %7";

if (name _killer != "Error: No unit") then {
	_sitrep = _sitrep + "||ENY: %8";
	if (currentweapon _killer != "") then {
		_sitrep = _sitrep + "|ENW: %9</t>"
	};
};

_sitrep = format [
	_sitrep,
	str(round random 9)+"#"+str(round random 9999),
	str(date select 0) + "-"+ str(date select 1) + "-"+ str(date select 2),
	[daytime,"HH:MM:SS"] call bis_fnc_timetostring,
	toupper localize format ["STR_SHORT_%1",rank _player],
	toupper name _player,
	mapGridPosition _player,
	toupper worldname,
	if(isPlayer _killer) then { name _killer }else{ toupper ((configfile >> "cfgvehicles" >> typeof _killer) call bis_fnc_displayname) },
	toupper ((configfile >> "cfgweapons" >> currentweapon _killer) call bis_fnc_displayname)
];

[_sitrep] spawn PO3_fnc_text_sitrep;