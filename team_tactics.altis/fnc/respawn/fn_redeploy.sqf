/*
	Author: Eightysix

	Description:

*/
private["_text"];

PO3_player_respawned = false;

closeDialog 0;

[4] spawn PO3_fnc_onkilled_camera;

121 cuttext [ localize "STR_PO3_RESPWN_REQUEST", "PLAIN",2];
sleep 2;
[1,""] call PO3_fnc_camera_fadeout;

createDialog "PO3_respawn_map";

waitUntil{ PO3_player_respawned || !dialog };

_text = if(Dialog) then { localize "STR_PO3_RESPWN_DEPLYED" }else{ "" };
[3,_text] spawn PO3_fnc_camera_fadein;

closeDialog 0;
PO3_selected_point = nil;
if(!isNil "PO3_respawn_selectMarker") then { deleteMarkerLocal PO3_respawn_selectMarker};
PO3_respawn_selectMarker = nil;

PO3_player_respawned = true;