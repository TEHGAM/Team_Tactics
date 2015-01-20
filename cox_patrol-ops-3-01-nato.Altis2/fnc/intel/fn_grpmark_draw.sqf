private["_pos","_type","_displayIcon"];

if(isNil "PO3_param_grpmark_allow") then { PO3_param_grpmark_allow = true };
if(isNil "PO3_param_grpmark_squad_allow") then { PO3_param_grpmark_squad_allow = true };

if(PO3_param_grpmark_allow || PO3_param_grpmark_squad_allow) then { ace_sys_tracking_markers_enabled = false };
if(PO3_param_grpmark_squad_allow) then { [] call PO3_fnc_grpmark_detectTeam };

waitUntil {
	_displayIcon = if( ([player] call PO3_fnc_hasARgear || !(PO3_param_hud_requireGlasses)) && PO3_hud_worldtoscreen_display ) then { true }else{ false };
	setGroupIconsVisible [PO3_param_grpmark_allow,_displayIcon];
	if(PO3_param_grpmark_allow) then { call PO3_fnc_grpmark_detectGroups };
	sleep 0.1;
	false;
};