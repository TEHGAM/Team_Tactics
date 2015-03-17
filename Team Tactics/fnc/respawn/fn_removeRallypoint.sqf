/*
	Author: Eightysix

	Description:

*/
if( player call PO3_fnc_checkActionBusy ) exitWith {};

[player,"HINT",localize "STR_PO3_RESPWN_RALLYREMVI"] call PO3_fnc_hint;
true call PO3_fnc_setActionBusy;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 8;
if!(alive player) exitwith {};

false call PO3_fnc_setActionBusy;

(_this select 0) setVariable ["PO3_rallypoint",false,true];
(_this select 0) setDamage 1;
