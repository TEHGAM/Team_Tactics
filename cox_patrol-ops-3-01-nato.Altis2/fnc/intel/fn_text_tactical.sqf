/*
	Author: Eightysix

	Description:
	Create Tactical Text : Local Only
*/
private["_row0","_row1","_row2","_script"];

if(isNil "PO3_text_tactical_display") then { PO3_text_tactical_display = false };

_row0 = if(count _this > 0) then { _this select 0 }else{ "" };
_row1 = if(count _this > 1) then { _this select 1 }else{ "" };
_row2 = if(count _this > 2) then { _this select 2 }else{ "" };

if(!PO3_text_tactical_display) then {
	PO3_text_tactical_display = true;

	_script = [_row0,_row1,_row2] spawn BIS_fnc_infoText;

	waitUntil{scriptDone _script};

	PO3_text_tactical_display = false;
};