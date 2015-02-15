PO3_fnc_crewlistInit = {
	uiNamespace setVariable ["PO3_hud_crewlist", _this select 0];
	uiNamespace setVariable ["PO3_hud_crewlistBG", (_this select 0) displayCtrl 0];
	uiNamespace setVariable ["PO3_hud_crewlistText", (_this select 0) displayCtrl 1];
};

PO3_fnc_crewlist_init = {
	uiNamespace setVariable ['PO3_hud_crewlist', _this select 0];
};

PO3_fnc_helmetCam_init = {
	uiNamespace setVariable ["hcam_ui_disp", (_this select 0)];
	uiNamespace setVariable ["hcam_ctrl_pip", (_this select 0) displayCtrl 0];
	uiNamespace setVariable ["hcam_ctrl_title", (_this select 0) displayCtrl 1];
	uiNamespace setVariable ["hcam_ctrl_back", (_this select 0) displayCtrl 2];
	uiNamespace setVariable ["hcam_ctrl_front", (_this select 0) displayCtrl 3];
};

PO3_fnc_liftRadar_init = {
	uiNamespace setVariable ["PO3_liftChopper_display",	(_this select 0) ];
	uiNamespace setVariable ["PO3_liftChopper_radarBG",	(_this select 0) displayCtrl 0];
	uiNamespace setVariable ["PO3_liftChopper_radar",	(_this select 0) displayCtrl 1];
	uiNamespace setVariable ["PO3_liftChopper_target",	(_this select 0) displayCtrl 2];
};

PO3_fnc_progressBar_init = {
	uinamespace setvariable ['PO3_ProgressBar_gui',(_this select 0)];
	uinamespace setvariable ['PO3_ProgressBar_gui_bg',(_this select 0) displayCtrl 0];
	uinamespace setvariable ['PO3_ProgressBar_gui_fg',(_this select 0) displayCtrl 1];
	uinamespace setvariable ['PO3_ProgressBar_gui_txt',(_this select 0) displayCtrl 2];
};

PO3_fnc_screentext_init = {
	uinamespace setvariable ['PO3_screentext_sitrep_text',_this select 0];
};

PO3_fnc_squadmod_init = {
	uiNamespace setVariable ['PO3_hud_squadmod_gui', _this select 0];
	uinamespace setvariable ['PO3_hud_squadmod_tx1', (_this select 0) displayCtrl 19]; // Players
	uinamespace setvariable ['PO3_hud_squadmod_lb1', (_this select 0) displayCtrl 20]; // Player List
	uinamespace setvariable ['PO3_hud_squadmod_tx2', (_this select 0) displayCtrl 21]; // Groups
	uinamespace setvariable ['PO3_hud_squadmod_lb2', (_this select 0) displayCtrl 22]; // Group List
	uinamespace setvariable ['PO3_hud_squadmod_ed1', (_this select 0) displayCtrl 23]; // Edit Squad Name
	uinamespace setvariable ['PO3_hud_squadmod_b04', (_this select 0) displayCtrl 24]; // Button Edit Squad
	uinamespace setvariable ['PO3_hud_squadmod_b03', (_this select 0) displayCtrl 25]; // Button New Group
	uinamespace setvariable ['PO3_hud_squadmod_b02', (_this select 0) displayCtrl 26]; // Button Join Group
	uinamespace setvariable ['PO3_hud_squadmod_b01', (_this select 0) displayCtrl 27]; // Button Make Leader
	uinamespace setvariable ['PO3_hud_squadmod_C01', (_this select 0) displayCtrl 28]; // Combo Assign Role
	uinamespace setvariable ['PO3_hud_squadmod_b08', (_this select 0) displayCtrl 29]; // Button Assign Role
	uinamespace setvariable ['PO3_hud_squadmod_b05', (_this select 0) displayCtrl 30]; // Button Request UAV
	uinamespace setvariable ['PO3_hud_squadmod_b06', (_this select 0) displayCtrl 31]; // Button Request UGV
	uinamespace setvariable ['PO3_hud_squadmod_b09', (_this select 0) displayCtrl 32]; // Button Skip Mission
	uinamespace setvariable ['PO3_hud_squadmod_b07', (_this select 0) displayCtrl 33]; // Button Close
	uinamespace setvariable ['PO3_hud_squadmod_b10', (_this select 0) displayCtrl 34]; // Button Driver License
	uinamespace setvariable ['PO3_hud_squadmod_b11', (_this select 0) displayCtrl 35]; // Button Pilot License
	PO3_sqdmod_VAR_selectedUnit = objnull;
	PO3_sqdmod_VAR_selectedGroup = grpnull;
	[] call PO3_fnc_sqdmodFunctions;
	[] call PO3_fnc_sqdmod_updateGUI;
};

PO3_fnc_world2Screen_toggle = {
	if( [player] call PO3_fnc_hasARgear || !(PO3_param_hud_requireGlasses) ) then {
		if(PO3_hud_worldtoscreen_display) then {
			PO3_hud_worldtoscreen_display = false;
			[true,"HINT",localize "STR_PO3_DIALOG_GRAPHIC_3DDisabled"] call PO3_fnc_hint;
			("BIS_layerEstShot"call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
		}else{
			PO3_hud_worldtoscreen_display = true;
			[true,"HINT",localize "STR_PO3_DIALOG_GRAPHIC_3DEnabled"] call PO3_fnc_hint;
		};
	}else{
		PO3_hud_worldtoscreen_display = false;
		[true,"HINT",localize "STR_PO3_DIALOG_GRAPHIC_3DRequire"] call PO3_fnc_hint;
	};
};
PO3_fnc_cursortoscreen_toggle = {
	if(PO3_hud_cursortoscreen_display) then {
		PO3_hud_cursortoscreen_display = false;
		[true,"HINT",localize "STR_PO3_DIALOG_GRAPHIC_2DDisabled"] call PO3_fnc_hint;
	}else{
		PO3_hud_cursortoscreen_display = true;
		[true,"HINT",localize "STR_PO3_DIALOG_GRAPHIC_2DEnabled"] call PO3_fnc_hint;
	};
};

[] spawn PO3_fnc_world2Screen;
//[] spawn PO3_fnc_crewlist;
