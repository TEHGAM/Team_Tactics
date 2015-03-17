/*
	Author: Eightysix

	Description:

*/
private["_group","_newName"];

_group = _this select 0;
_newName = _this select 1;

if ( !([_group,player] call PO3_fnc_isTeamLeader) && !([player] call PO3_fnc_isAdministrator) ) exitWith { [true,"HTINTC","You are not authorised to change the team name"] call PO3_fnc_hint };

PO3_pVAR_changeGroupID = [_group,_newName]; publicVariable "PO3_pVAR_changeGroupID";

if(PO3CLI) then {
	PO3_pVAR_changeGroupID call PO3_fnc_setGroupID;
};