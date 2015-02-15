/*
	Author: Eightysix

	Description:

*/
private["_lives","_gearList"];

PO3_player_respawned = false;
PO3_player_respawned_byHALO = false;
_role = PO3_player_body getVariable ["PO3_VAR_roleAttribute","Rifleman"];
_isCrew = PO3_player_body getVariable ["PO3_VAR_DriverLicense",false];
_isPilot = PO3_player_body getVariable ["PO3_VAR_PilotLicense",false];
_gearList = if!(isNil "PO3_VAR_savedLoadout") then { PO3_VAR_savedLoadout }else{ [PO3_player_body] call PO3_fnc_getLoadout };

closeDialog 0;

[_this select 0,_this select 1] spawn PO3_fnc_onkilled_sitrep;
[PO3_param_respawn_playertime] spawn PO3_fnc_onkilled_effects;
[PO3_param_respawn_playertime] spawn PO3_fnc_onkilled_camera;

121 cuttext [ localize "STR_PO3_RESPWN_KILLED", "PLAIN",2];
sleep PO3_param_respawn_playertime;
[1,""] call PO3_fnc_camera_fadeout;

createDialog "PO3_respawn_map";

while{ !PO3_player_respawned } do {
	if(!dialog) then {
		sleep 1;
		createDialog "PO3_respawn_map";
	};
};

_lives = if( PO3_param_respawn_deathcount >= 0) then { format[localize "STR_PO3_RESPWN_LIFEREM", round(PO3_param_respawn_deathcount)] }else{ "" };
[5,format[localize "STR_PO3_RESPWN_RENTER",_lives] ] spawn PO3_fnc_camera_fadein;

closeDialog 0;
PO3_selected_point = nil;
if(!isNil "PO3_respawn_selectMarker") then { deleteMarkerLocal PO3_respawn_selectMarker};

PO3_respawn_selectMarker = nil;
PO3_player_body spawn {
	hideBody _this;
	sleep 3;
	deleteVehicle _this;
};

player setVariable ["PO3_VAR_roleAttribute",_role,true];
if(_isCrew) then {[player] call PO3_fnc_setAsCrewman;};
if(_isPilot) then {[player] call PO3_fnc_setAsPilot;};

if !(PO3_player_respawned_byHALO) then {
	[player,_gearList] call PO3_fnc_setLoadout;
}else{
	waitUntil {isTouchingGround player || (getPos player select 2) < 1};
	[player,_gearList] call PO3_fnc_setLoadout;
};

PO3_player_body = player;
PO3_player_respawned = true;