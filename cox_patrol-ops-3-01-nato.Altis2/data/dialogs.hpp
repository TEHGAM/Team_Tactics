// =========================================================================================================
// !!  DO NOT MODIFY THIS FILE  !!
// =========================================================================================================

#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_HITZONES         17
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_CHECKBOX         77   //MUF-A3
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C
#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0
#define ST_UPPERCASE      0xC0
#define ST_LOWERCASE      0xD0
#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800
#define ST_TITLE          ST_TITLE_BAR + ST_CENTER
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400
#define SL_TEXTURES       0x10
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20
#define TOSTRING(TEXT)	  #TEXT

#define	flag_west		"\A3\ui_f\data\gui\rsc\RscDisplayMultiplayerSetup\flag_bluefor_ca.paa"
#define	flag_east		"\A3\ui_f\data\gui\rsc\RscDisplayMultiplayerSetup\flag_opfor_ca.paa"
#define	flag_guer		"\A3\ui_f\data\gui\rsc\RscDisplayMultiplayerSetup\flag_indep_ca.paa"
#define	flag_civl		"\A3\ui_f\data\gui\rsc\RscDisplayMultiplayerSetup\flag_civil_ca.paa"
#define GUI_FONT_NORMAL		PuristaMedium
#define GUI_FONT_BOLD		PuristaSemibold
#define GUI_FONT_MONO		EtelkaMonospaceProBold
#define GUI_FONT_SMALL		PuristaMedium
#define GUI_FONT_THIN		PuristaLight
#define GUI_BCG_RGB_R		"(profileNamespace getvariable ['GUI_BCG_RGB_R',0.6784])"
#define GUI_BCG_RGB_G		"(profileNamespace getvariable ['GUI_BCG_RGB_G',0.7490])"
#define GUI_BCG_RGB_B		"(profileNamespace getvariable ['GUI_BCG_RGB_B',0.5137])"
#define GUI_BCG_RGB_A		"(profileNamespace getvariable ['GUI_BCG_RGB_A',0.7000])"
#define GUI_BLU_RGB_R		"(profilenamespace getvariable ['Map_BLUFOR_R',0.0])"
#define GUI_BLU_RGB_G		"(profilenamespace getvariable ['Map_BLUFOR_G',0.8])"
#define GUI_BLU_RGB_B		"(profilenamespace getvariable ['Map_BLUFOR_B',1.0])"
#define GUI_BLU_RGB_A		"(profilenamespace getvariable ['Map_BLUFOR_A',0.8])"
#define GUI_OPF_RGB_R		"(profilenamespace getvariable ['Map_BLUFOR_R',0.0])"
#define GUI_OPF_RGB_G		"(profilenamespace getvariable ['Map_BLUFOR_G',1.0])"
#define GUI_OPF_RGB_B		"(profilenamespace getvariable ['Map_BLUFOR_B',1.0])"
#define GUI_OPF_RGB_A		"(profilenamespace getvariable ['Map_BLUFOR_A',0.8])"
#define GUI_IND_RGB_R		"(profilenamespace getvariable ['Map_BLUFOR_R',0.0])"
#define GUI_IND_RGB_G		"(profilenamespace getvariable ['Map_BLUFOR_G',1.0])"
#define GUI_IND_RGB_B		"(profilenamespace getvariable ['Map_BLUFOR_B',1.0])"
#define GUI_IND_RGB_A		"(profilenamespace getvariable ['Map_BLUFOR_A',0.8])"
#define BUTTON_SOUND_CLICK	{"\A3\ui_f\data\sound\onclick", 0.07, 1}
#define BUTTON_SOUND_ENTER	{"\A3\ui_f\data\sound\onover", 0.09, 1}
#define BUTTON_SOUND_ESCAP	{"\A3\ui_f\data\sound\onescape", 0.09, 1}
#define BUTTON_SOUND_BPUSH	{"\A3\ui_f\data\sound\new1", 0.0, 0}
#define SCROLL_ARROW_EMPTY	"\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"
#define SCROLL_ARROR_FULL	"\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"
#define SCROLL_BORDER		"\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"
#define SCROLL_THUMB		"\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"
#define COMBO_ARROW_EMPTY	"\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa"
#define COMBO_ARROW_FULL	"\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa"
#define ANIMTEXT_DEFAULT	"\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa"
#define ANIMTEXT_NORMAL		"\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa"
#define ANIMTEXT_DISABLED	"\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa"
#define ANIMTEXT_OVER		"\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa"
#define ANIMTEXT_FOCUS		"\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa"
#define ANIMTEXT_PRESS		"\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa"
#define ANIMTEXT_NOSHORT	"\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa"
#define MAP_ICON_BUNKER		"\A3\ui_f\data\map\mapcontrol\bunker_ca.paa"
#define MAP_ICON_BUSH		"\A3\ui_f\data\map\mapcontrol\bush_ca.paa"
#define MAP_ICON_BUSSTOP	"\A3\ui_f\data\map\mapcontrol\busstop_CA.paa"
#define MAP_ICON_CHAPEL 	"\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa"
#define MAP_ICON_CHURCH 	"\A3\ui_f\data\map\mapcontrol\church_CA.paa"
#define MAP_ICON_COMMAND	"\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa"
#define MAP_ICON_CROSS		"\A3\ui_f\data\map\mapcontrol\Cross_CA.paa"
#define MAP_ICON_CUSTOMMARK	"\A3\ui_f\data\map\mapcontrol\custommark_ca.paa"
#define MAP_ICON_FORTRSS	"\A3\ui_f\data\map\mapcontrol\bunker_ca.paa"
#define MAP_ICON_FOUNTAIN	"\A3\ui_f\data\map\mapcontrol\fountain_ca.paa"
#define MAP_ICON_FUEL		"\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa"
#define MAP_ICON_HOSTPITAL	"\A3\ui_f\data\map\mapcontrol\hospital_CA.paa"
#define MAP_ICON_LIGHTHSE	"\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa"
#define MAP_ICON_POWER		"\A3\ui_f\data\map\mapcontrol\power_CA.paa"
#define MAP_ICON_POWERSOLAR	"\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa"
#define MAP_ICON_POWERWAVE	"\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa"
#define MAP_ICON_POWERWIND	"\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa"
#define MAP_ICON_QUAY		"\A3\ui_f\data\map\mapcontrol\quay_CA.paa"
#define MAP_ICON_ROCK		"\A3\ui_f\data\map\mapcontrol\rock_ca.paa"
#define MAP_ICON_RUIN		"\A3\ui_f\data\map\mapcontrol\ruin_ca.paa"
#define MAP_ICON_SHIPWRECK	"\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa"
#define MAP_ICON_TREESMALL	"\A3\ui_f\data\map\mapcontrol\bush_ca.paa"
#define MAP_ICON_STACK		"\A3\ui_f\data\map\mapcontrol\stack_ca.paa"
#define MAP_ICON_TASK		"\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa"
#define MAP_ICON_TASK_CREA	"\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa"
#define MAP_ICON_TASK_CANX	"\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa"
#define MAP_ICON_TASK_DONE	"\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa"
#define MAP_ICON_TASK_FAIL	"\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa"
#define MAP_ICON_TOURISM	"\A3\ui_f\data\map\mapcontrol\tourism_ca.paa"
#define MAP_ICON_TRANSMITR	"\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa"
#define MAP_ICON_TREE		"\A3\ui_f\data\map\mapcontrol\bush_ca.paa"
#define MAP_ICON_VIEWTWR	"\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa"
#define MAP_ICON_WATERTWR	"\A3\ui_f\data\map\mapcontrol\watertower_CA.paa"
#define MAP_ICON_WP		"\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa"
#define MAP_ICON_WP_CMPL	"\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa"

#define PO3CNTRL_00	860000	// Player Hud Settings
#define PO3CNTRL_01	860001	// Player Hud Slider
#define PO3CNTRL_02	860002	// Player Hud Slider Text
#define PO3CNTRL_03	860003	// Player Hud SquadMod
#define PO3CNTRL_04	860004	// 
#define PO3CNTRL_05	860005	// 
#define PO3CNTRL_06	860006	// RscTitles Screentext Sitrep_0
#define PO3CNTRL_07	860007	// RscTitles Screentext Sitrep_1
#define PO3CNTRL_08	860008	// RscTitles SquadList Bg
#define PO3CNTRL_09	860009	// RscTitles SquadList Text
#define PO3CNTRL_10	860010	// Respawn Dialog
#define PO3CNTRL_11	860011	// Respawn Map
#define PO3CNTRL_12	860012	// Respawn List
#define PO3CNTRL_13	860013	// Respawn Warning
#define PO3CNTRL_14	860014	// RscTitles LifterHUD
#define PO3CNTRL_15	860015	// Pl
#define PO3CNTRL_16	860016	// 
#define PO3CNTRL_17	860017	// 
#define PO3CNTRL_18	860018	// 
#define PO3CNTRL_19	860019	// 
#define PO3CNTRL_20	860020	// PO3 Loadout
#define PO3CNTRL_21	860021	// 
#define PO3CNTRL_22	860022	// 
#define PO3CNTRL_23	860023	// 
#define PO3CNTRL_24	860024	// 
#define PO3CNTRL_25	860025	// 
#define PO3CNTRL_26	860026	// 
#define PO3CNTRL_27	860027	// 
#define PO3CNTRL_28	860028	// 
#define PO3CNTRL_29	860029	// 
#define PO3CNTRL_30	860030	// 
#define PO3CNTRL_31	860031	// 
#define PO3CNTRL_32	860032	// 
#define PO3CNTRL_33	860033	// 
#define PO3CNTRL_34	860034	// 
#define PO3CNTRL_35	860035	// 
#define PO3CNTRL_36	860036	// 
#define PO3CNTRL_37	860037	// 
#define PO3CNTRL_38	860038	// 
#define PO3CNTRL_39	860039	// 

author		= "$STR_MISSION_AUTHOR";// <!-- CHANGE in Stringtable.xml
OnLoadName	= "$STR_MISSION_NAME";	// <!-- CHANGE in Stringtable.xml
OnLoadMission	= "$STR_MISSION_DESC";	// <!-- CHANGE in Stringtable.xml
aiKills		= 0;
briefing	= 0;
debriefing	= 1;
onLoadIntroTime = 1;
respawn		= 3;
respawnDelay	= 3;
respawnVehicleDelay = 3;
respawnDialog	= 0;
respawnOnStart	= 0;

__EXEC(_loadscreenpicture = ["data\img_PO3flag_1.paa","data\img_PO3flag_2.paa","data\img_PO3flag_3.paa","data\img_PO3flag_4.paa"]); // <!-- BON_Inf :D
loadScreen		= __EVAL(_loadscreenpicture select round random (count _loadscreenpicture - 1));
overviewPicture	= "\a3\Missions_F_gamma\data\img\showcase_arma_overview_ca.paa";
overviewText	= "$STR_MISSION_DESC";

class 86RActiveText {
	access = 0;
	color[] = {1,1,1,1};
	colorActive[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, 1};
	colorText[] = {1,1,1,1};
	default = 0;
	font = GUI_FONT_NORMAL;
	h = 0.035;
	idc = -1;
	shadow = 2;
	sizeEx = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	soundClick[] = BUTTON_SOUND_CLICK;
	soundEnter[] = BUTTON_SOUND_ENTER;
	soundEscape[] = BUTTON_SOUND_ENTER;
	soundPush[] = BUTTON_SOUND_BPUSH;
	style = 2;
	text = "";
	type = 11;
	w = 0.035;
	x = 0;
	y = 0;
};

class 86RButton {
	access = 0;
	type = 1;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, 0.7};
	colorBackgroundActive[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, 1};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	colorFocused[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, 1};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
	soundClick[] = BUTTON_SOUND_CLICK;
	soundEnter[] = BUTTON_SOUND_ENTER;
	soundEscape[] = BUTTON_SOUND_ENTER;
	soundPush[] = BUTTON_SOUND_BPUSH;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = GUI_FONT_NORMAL;
	sizeEx = "( ( (1 / 1.2) / 20) * 0.9);";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class 86RButtonEmpty {
	access = 0;
	type = 1;
	text = "";
	colorText[] = {0,0,0,0};
	colorDisabled[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0.6};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0.6};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	soundClick[] = BUTTON_SOUND_CLICK;
	soundEnter[] = BUTTON_SOUND_ENTER;
	soundEscape[] = BUTTON_SOUND_ENTER;
	soundPush[] = BUTTON_SOUND_BPUSH;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 0;
	font = GUI_FONT_NORMAL;
	sizeEx = "( ( (1 / 1.2) / 20) * 0.9);";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class 86RButtonX {
	action = "";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,0.5)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	color2[] = {1,1,1,1};
	color[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
	colorBackground2[] = {1,1,1,0.5};
	colorBackgroundFocused[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorFocused[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	default = 0;
	font = GUI_FONT_NORMAL;
	idc = 19902304;
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	shadow = 0;
	shortcuts[] = {};
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	soundClick[] = BUTTON_SOUND_CLICK;
	soundEnter[] = BUTTON_SOUND_ENTER;
	soundEscape[] = BUTTON_SOUND_ENTER;
	soundPush[] = BUTTON_SOUND_BPUSH;
	style = "0x02 + 0xC0";
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	type = 16;
	class Attributes {
		font = GUI_FONT_NORMAL;
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class AttributesImage {
		font = GUI_FONT_NORMAL;
		color = "#E5E5E5";
		align = "left";
	};
	class HitZone {
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos {
		left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	class TextPos {
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
};

class 86RButtonMenu {
	action = "";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,0.5)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	color[] = {1,1,1,1};
	color2[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,0.5};
	colorBackground[] = {0,0,0,0.8};
	colorDisabled[] = {1,1,1,0.25};
	colorText[] = {1,1,1,1};
	default = 0;
	font = GUI_FONT_NORMAL;
	h = 0.039216;
	idc = -1;
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	shadow = 0;
	shortcuts[] = {};
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	soundClick[] = BUTTON_SOUND_CLICK;
	soundEnter[] = BUTTON_SOUND_ENTER;
	soundEscape[] = BUTTON_SOUND_ENTER;
	soundPush[] = BUTTON_SOUND_BPUSH;
	style = "0x02 + 0xC0";
	text = "";
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	type = 16;
	w = 0.095589;
	x = 0;
	y = 0;
	class Attributes {
		font = GUI_FONT_NORMAL;
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class AttributesImage {
		font = GUI_FONT_NORMAL;
		color = "#E5E5E5";
		align = "left";
	};
	class HitZone {
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos {
		h = 0.03;
		left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
	};
	class TextPos {
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
};

class 86RControlsGroup {
	h = 1;
	idc = -1;
	shadow = 0;
	style = 16;
	type = 15;
	w = 1;
	x = 0;
	y = 0;
	class Controls {};
	class HScrollbar {
		color[] = {1,1,1,1};
		height = 0.028;
		shadow = 0;
	};
	class ScrollBar {
		arrowEmpty = SCROLL_ARROW_EMPTY;
		arrowFull = SCROLL_ARROR_FULL;
		border = SCROLL_BORDER;
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = SCROLL_THUMB;
	};
	class VScrollbar {
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		autoScrollSpeed = -1;
		color[] = {1,1,1,1};
		shadow = 0;
		width = 0.021;
	};
};

class 86RControlsGroupNoScrollbars : 86RControlsGroup {
	class VScrollbar : VScrollbar {
		width = 0;
	};
	
	class HScrollbar : HScrollbar {
		height = 0;
	};
};

class 86REdit {
	access = 0;
	autocomplete = "";
	canModify = 1;
	colorBackground[] = {0,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelection[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, 0.7};
	colorText[] = {0.95,0.95,0.95,1};
	font = GUI_FONT_NORMAL;
	h = 0.04;
	shadow = 2;
	size = 0.2;
	sizeEx = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	style = "0x00 + 0x40";
	text = "";
	type = 2;
	w = 0.2;
	x = 0;
	y = 0;
};

class 86RFrame {
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = GUI_FONT_NORMAL;
	shadow = 2;
	sizeEx = 0.02;
	style = 64;
	text = "";
	type = 0;
};

class 86RMap {
	access = 0;
	alphaFadeEndScale = 0.4;
	alphaFadeStartScale = 0.36;
	colorBackground[] = {0.969,0.957,0.949,1};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorForestBorder[] = {0,0,0,0};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	colorInactive[] = {1,1,1,0.5};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorMainRoads[] = {0.9,0.5,0.3,1};
	colorMainRoadsFill[] = {1,0.6,0.4,1};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorOutside[] = {0,0,0,1};
	colorPowerLines[] = {0.1,0.1,0.1,1};
	colorRailWay[] = {0.8,0.2,0,1};
	colorRoads[] = {0.7,0.7,0.7,1};
	colorRoadsFill[] = {1,1,1,1};
	colorRocks[] = {0,0,0,0.3};
	colorRocksBorder[] = {0,0,0,0};
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorText[] = {0,0,0,1};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorTracksFill[] = {0.84,0.76,0.65,1};
	font = GUI_FONT_NORMAL;
	fontGrid = GUI_FONT_NORMAL;
	fontInfo = GUI_FONT_NORMAL;
	fontLabel = GUI_FONT_NORMAL;
	fontLevel = GUI_FONT_NORMAL;
	fontNames = GUI_FONT_NORMAL;
	fontUnits = GUI_FONT_NORMAL;
	h = "SafeZoneH";
	idc = -1;
	maxSatelliteAlpha = 0.85;
	moveOnEdges = 0;
	ptsPerSquareCLn = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareObj = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 3;
	scaleDefault = 0.16;
	scaleMax = 1;
	scaleMin = 0.001;
	shadow = 0;
	showCountourInterval = 0;
	sizeEx = 0.04;
	sizeExGrid = 0.02;
	sizeExInfo = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
	sizeExLabel = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
	sizeExLevel = 0.02;
	sizeExNames = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2;";
	sizeExUnits = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
	stickX[] = {0.2,["Gamma",1,1.5]};
	stickY[] = {0.2,["Gamma",1,1.5]};
	style = 48;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	type = 101;
	w = "SafeZoneWAbs";
	x = "SafeZoneXAbs";
	y = "SafeZoneY";

	class ActiveMarker {
		color[] = {0.3,0.1,0.9,1};
		size = 50;
	};

	class Bunker {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = MAP_ICON_BUNKER;
		importance = "1.5 * 14 * 0.05";
		size = 14;
	};

	class Bush {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = ;
		importance = "0.2 * 14 * 0.05 * 0.05";
		size = "14/2";
	};

	class BusStop {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_BUSSTOP;
		importance = 1;
		size = 24;
	};

	class Chapel {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {0,0,0,1};
		icon = 	MAP_ICON_CHAPEL;
		importance = 1;
		size = 24;
	};

	class Church {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_CHURCH;
		importance = 1;
		size = 24;
	};

	class Command {
		coefMax = 1;
		coefMin = 1;
		color[] = {1,1,1,1};
		icon = MAP_ICON_COMMAND;
		importance = 1;
		size = 18;
	};

	class Cross {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {0,0,0,1};
		icon = MAP_ICON_CROSS;
		importance = 1;
		size = 24;
	};

	class CustomMark {
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = MAP_ICON_CUSTOMMARK;
		importance = 1;
		size = 24;
	};

	class Fortress {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = MAP_ICON_FORTRSS;
		importance = "2 * 16 * 0.05";
		size = 16;
	};

	class Fountain {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = MAP_ICON_FOUNTAIN;
		importance = "1 * 12 * 0.05";
		size = 11;
	};

	class Fuelstation {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_FUEL;
		importance = 1;
		size = 24;
	};

	class Hospital {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_HOSTPITAL;
		importance = 1;
		size = 24;
	};

	class Legend {
		color[] = {0,0,0,1};
		colorBackground[] = {1,1,1,0.5};
		font = GUI_FONT_NORMAL;
		h = "3.5 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
		w = "10 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
		x = "SafeZoneX +  		( ((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};

	class Lighthouse {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_LIGHTHSE;
		importance = 1;
		size = 24;
	};

	class power {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_POWER;
		importance = 1;
		size = 24;
	};

	class powersolar {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = ;
		importance = 1;
		size = 24;
	};

	class powerwave {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_POWERWAVE;
		importance = 1;
		size = 24;
	};

	class powerwind {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_POWERWIND;
		importance = 1;
		size = 24;
	};

	class Quay {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_QUAY;
		importance = 1;
		size = 24;
	};

	class Rock {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.1,0.1,0.1,0.8};
		icon = MAP_ICON_ROCK;
		importance = 0.3;
		size = 12;
	};

	class Ruin {
		coefMax = 4;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = MAP_ICON_RUIN;
		importance = 0.96;
		size = 16;
	};

	class shipwreck {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_SHIPWRECK;
		importance = 1;
		size = 24;
	};

	class SmallTree {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = MAP_ICON_TREESMALL;
		importance = 0.36;
		size = 12;
	};

	class Stack {
		coefMax = 4;
		coefMin = 0.9;
		color[] = {0,0,0,1};
		icon = MAP_ICON_STACK;
		importance = 1.6;
		size = 20;
	};

	class Task {
		coefMax = 1;
		coefMin = 1;
		color[] = {"(missionNamespace getvariable ['IGUI_TEXT_RGB_R',0])","(missionNamespace getvariable ['IGUI_TEXT_RGB_G',1])","(missionNamespace getvariable ['IGUI_TEXT_RGB_B',1])","(missionNamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		colorCanceled[] = {0.7,0.7,0.7,1};
		colorCreated[] = {1,1,1,1};
		colorDone[] = {0.7,1,0.3,1};
		colorFailed[] = {1,0.3,0.2,1};
		icon = MAP_ICON_TASK;
		iconCreated = MAP_ICON_TASK_CREA;
		iconCanceled = MAP_ICON_TASK_CANX;
		iconDone = MAP_ICON_TASK_DONE;
		iconFailed = MAP_ICON_TASK_FAIL;
		importance = 1;
		size = 27;
	};

	class Tourism {
		coefMax = 4;
		coefMin = 0.7;
		color[] = {0,0,0,1};
		icon = MAP_ICON_TOURISM;
		importance = 0.8;
		size = 16;
	};

	class Transmitter {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_TRANSMITR;
		importance = 1;
		size = 24;
	};

	class Tree {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = MAP_ICON_TREE;
		importance = 0.72;
		size = 12;
	};

	class ViewTower {
		coefMax = 4;
		coefMin = 0.5;
		color[] = {0,0,0,1};
		icon = MAP_ICON_VIEWTWR;
		importance = 2;
		size = 16;
	};

	class Watertower {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = MAP_ICON_WATERTWR;
		importance = 1;
		size = 24;
	};

	class Waypoint {
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = MAP_ICON_WP;
		importance = 1;
		size = 24;
	};

	class WaypointCompleted {
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = MAP_ICON_WP_CMPL;
		importance = 1;
		size = 24;
	};
};

class 86RPicture {
	access = 0;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	fixedWidth = 0;
	font = GUI_FONT_NORMAL;
	h = 0.15;
	idc = -1;
	lineSpacing = 0;
	shadow = 0;
	sizeEx = 0;
	style = ST_PICTURE;
	text = "";
	type = CT_STATIC;
	w = 0.2;
	x = 0;
	y = 0;
};

class 86RText {
	access = 0;
	colorBackground[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	fixedWidth = 0;
	font = GUI_FONT_NORMAL;
	h = 0.037;
	idc = -1;
	linespacing = 1;
	shadow = 1;
	SizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	style = 0;
	text = "";
	type = 0;
	w = 0.3;
	x = 0;
	y = 0;
};

class 86RLine : 86RText {
	idc = -1;
	style = 176;
	x = 0.17;
	y = 0.48;
	w = 0.66;
	h = 0;
	text = "";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1.0};
};

class 86RStructuredText {
	access = 0;
	colorText[] = {1,1,1,1};
	h = 0.035;
	idc = -1;
	shadow = 1;
	size = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	style = 0;
	text = "";
	type = 13;
	w = 0.1;
	x = 0;
	y = 0;
	class Attributes {
		align = "left";
		color = "#ffffff";
		font = GUI_FONT_NORMAL;
		shadow = 1;
	};
};

class 86RTitle {
	access = 0;
	colorBackground[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0.5};
	colorText[] = {0.95,0.95,0.95,1};
	fixedWidth = 0;
	font = GUI_FONT_NORMAL;
	h = 0.037;
	idc = -1;
	linespacing = 1;
	shadow = 0;
	sizeEx = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	style = 0;
	text = "";
	type = 0;
	w = 0.7;
	x = 0.15;
	y = 0.06;
};

class 86RCheckbox {
	checked_strings[] = {"CHECKED"};
	color[] = {0,0,0,0};
	colorBackground[] = {0,0,1,1};
	colorDisable[] = {0.4,0.4,0.4,1};
	colorSelect[] = {0,0,0,1};
	colorSelectedBg[] = {GUI_BCG_RGB_R,GUI_BCG_RGB_G,GUI_BCG_RGB_B,1};
	colorText[] = {1,0,0,1};
	colorTextDisable[] = {0.4,0.4,0.4,1};
	colorTextSelect[] = {0,0.8,0,1};
	columns = 1;
	font = GUI_FONT_NORMAL;
	h = 0.029412;
	idc = -1;
	rows = 1;
	sizeEx = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
	strings[] = {"UNCHECKED"};
	style = 0;
	type = 7;
	w = "LINE_W(WVAL)";
	x = "LINE_X(XVAL)";
	y = "LINE_Y";
};

class 86RCombo {
	access = 0;
	arrowEmpty = COMBO_ARROW_EMPTY;
	arrowFull = COMBO_ARROW_FULL;
	color[] = {1,1,1,1};
	colorActive[] = {1,0,0,1};
	colorBackground[] = {0,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,1};
	colorSelect[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.7};
	colorText[] = {0.95,0.95,0.95,1};
	font = GUI_FONT_NORMAL;
	h = 0.035;
	maxHistoryDelay = 1;
	shadow = 0;
	sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	soundCollapse[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundSelect[] = {"",0.1,1};
	style = 16;
	type = 4;
	w = 0.12;
	wholeHeight = 0.45;
	x = 0;
	y = 0;
	class ComboScrollBar {
		arrowEmpty = SCROLL_ARROW_EMPTY;
		arrowFull = SCROLL_ARROR_FULL;
		border = SCROLL_BORDER;
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = SCROLL_THUMB;
	};
};

class 86RListBox {
	access = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	autoScrollSpeed = -1;
	color[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.3};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,0};
	colorSelect2[] = {0,0,0,1};
	colorSelect[] = {0,0,0,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorShadow[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = GUI_FONT_NORMAL;
	h = 0.4;
	maxHistoryDelay = 1;
	period = 1.2;
	rowHeight = 0;
	shadow = 0;
	sizeEx = "( ( (	( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	soundSelect[] = {"",0.1,1};
	style = 16;
	type = 5;
	w = 0.4;
	class ListScrollBar {
		arrowEmpty = SCROLL_ARROW_EMPTY;
		arrowFull = SCROLL_ARROR_FULL;
		border = SCROLL_BORDER;
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = SCROLL_THUMB;
	};
};

class 86RSlider {
	access = 0;
	type = 3;
	style = 1024;
	w = 0.3;
	color[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	shadow = 0;
	h = 0.025;
};

class 86RXSliderH {
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	color[] = {1,1,1,0.4};
	colorActive[] = {1,1,1,1};
	colorDisable[] = {1,1,1,0.4};
	colorDisabled[] = {1,1,1,0.2};
	h = 0.029412;
	shadow = 2;
	style = "0x400	+ 0x10";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
	type = 43;
	w = 0.4;
	x = 0;
	y = 0;
};

class 86RShortcutButton {
	action = "";
	animTextureDefault = ANIMTEXT_DEFAULT;
	animTextureNormal = ANIMTEXT_NORMAL;
	animTextureDisabled = ANIMTEXT_DISABLED;
	animTextureOver = ANIMTEXT_OVER;
	animTextureFocused = ANIMTEXT_FOCUS;
	animTexturePressed = ANIMTEXT_PRESS;
	animTextureNoShortcut = ANIMTEXT_NOSHORT;
	color[] = {1, 1, 1, 1.0};
	color2[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorBackground[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, 1};
	colorBackground2[] = {1, 1, 1, 1};
	default = 0;
	font = GUI_FONT_NORMAL;
	h = "( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	idc = -1;
	period = 0.4;
	periodFocus = 1.2;
	periodOver = 0.8;
	shadow = 1;
	size = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	sizeEx = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);";
	soundClick[] = BUTTON_SOUND_CLICK;
	soundEnter[] = BUTTON_SOUND_ENTER;
	soundEscape[] = BUTTON_SOUND_ENTER;
	soundPush[] = BUTTON_SOUND_BPUSH;
	style = 0;
	text = "";
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	w = 0.183825;
	class Attributes {
		font = GUI_FONT_NORMAL;
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage {
		font = GUI_FONT_NORMAL;
		color = "#E5E5E5";
		align = "left";
	};
	class HitZone {
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos {
		left = 0;
		top = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 20) - ( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) ) / 2";
		w = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos {
		left = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 20) - ( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) ) / 2";
		right = 0.005;
		bottom = 0.0;
	};
};

class 86RProgress {
	type = 8;
	style = 0;
	x = 0.344;
	y = 0.619;
	w = 0.313726;
	h = 0.0261438;
	shadow = 2;
	texture = "\A3\ui_f\data\GUI\RscCommon\RscProgress\progressbar_ca.paa";
	colorFrame[] = {0,0,0,0};
	colorBar[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, GUI_BCG_RGB_A};
};

class 86RHTML {
	colorText[] = {1, 1, 1, 1.0};
	colorBold[] = {1, 1, 1, 1.0};
	colorLink[] = {1, 1, 1, 0.75};
	colorLinkActive[] = {1, 1, 1, 1.0};
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	prevPage = "\A3\ui_f\data\gui\Rsccommon\Rschtml\arrow_left_ca.paa";
	nextPage = "\A3\ui_f\data\gui\Rsccommon\Rschtml\arrow_right_ca.paa";
	shadow = 2;
	class H1 {
		font = GUI_FONT_NORMAL;
		fontBold = GUI_FONT_BOLD;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
		align = "left";
	};
	class H2 {
		font = GUI_FONT_NORMAL;
		fontBold = GUI_FONT_BOLD;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "right";
	};
	class H3 {
		font = GUI_FONT_NORMAL;
		fontBold = GUI_FONT_BOLD;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	class H4 {
		font = GUI_FONT_NORMAL;
		fontBold = GUI_FONT_BOLD;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	class H5 {
		font = GUI_FONT_NORMAL;
		fontBold = GUI_FONT_BOLD;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	class H6 {
		font = GUI_FONT_NORMAL;
		fontBold = GUI_FONT_BOLD;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	class P {
		font = GUI_FONT_NORMAL;
		fontBold = GUI_FONT_BOLD;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
};

class PO3_img_pda : 86RPicture {
	text = "data\img_amrelda5.paa";
	x = 0 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.644 * safezoneH;
};

class PO3_img_tablet : 86RPicture {
	text = "data\img_amreldk8.paa";
	x = -0.0446875 * safezoneW + safezoneX;
	y = 0.0939094 * safezoneH + safezoneY;
	w = 1.00406 * safezoneW;
	h = 0.840187 * safezoneH;
};

class PO3_respawn_map {
	idd = PO3CNTRL_10;
	movingEnable = false;
	enableSimulation = true;
	onload = "uinamespace setvariable ['PO3_respawn_gui',_this select 0]; _this spawn PO3_fnc_GUI_respawn;";
	onUnload = "uinamespace setvariable ['PO3_respawn_gui',nil];";
	class controlsBackground {
		class PO3_respawn_tablet : PO3_img_tablet {
			idc = -1;
		};
		class PO3_respawn_bg : 86RText {
			idc = -1;
			colorBackground[] = { 0.2, 0.2, 0.2, 1 };
			x = 0.20475 * safezoneW + safezoneX;
			y = 0.2026 * safezoneH + safezoneY;
			w = 0.590625 * safezoneW;
			h = 0.595 * safezoneH;
			text = "";
		};
		class PO3_respawn_map : 86RMap {
			idc = PO3CNTRL_11;
			showCountourInterval = "true";
			x = 0.425 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.3625 * safezoneW;
			h = 0.54 * safezoneH;
		};
	};
	class controls {
		class PO3_respawn_text : 86RText {
			idc = -1;
			text = $STR_PO3_RESPWN_TITLE;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.55625 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_respawn_warning : 86RStructuredText {
			idc = PO3CNTRL_13;
			text = $STR_PO3_RESPWN_CANTDEPLY;
			colorBackground[] = {1,0.6,0,0.8};
			x = 0.425 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.3625 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes {
				align = "center";
			};
		};
		class PO3_respawn_list : 86RListbox {
			idc = PO3CNTRL_12;
			onLBSelChanged = "_this call PO3_fnc_GUI_selectRespawnPos;";
			onLBDblClick = "_this call PO3_fnc_GUI_acceptRespawnPos;";
			sizeEx = "( ( (	( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4);";
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.5 * safezoneH;
		};
		class PO3_respawn_close : 86RButton {
			idc = -1;
			text = "X";
			tooltip = $STR_PO3_TEXT_CLOSE;
			onButtonClick = "closeDialog 0;";
			x = "0.775 * safezoneW + safezoneX";
			y = "0.21 * safezoneH + safezoneY";
			w = "0.0125 * safezoneW";
			h = "0.02 * safezoneH";
		};
		class PO3_respawn_accept : 86RButton {
			idc = -1;
			text = $STR_PO3_TEXT_ACCEPT;
			tooltip = $STR_PO3_TEXT_ACCEPT;
			onButtonClick = "_this call PO3_fnc_GUI_acceptRespawnPos;";
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.75 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_respawn_cancel : 86RButton {
			idc = -1;
			text = $STR_PO3_TEXT_CANCEL;
			tooltip = $STR_PO3_TEXT_CANCEL;
			onButtonClick = "closeDialog 0;";
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.75 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
};

class PO3_player_HUDsettings {
	idd = PO3CNTRL_00;
	movingEnable = false;
	enableSimulation = true;
	onload = "_this spawn PO3_fnc_GUI_settings;";

	class controlsBackground {
		class PO3_ncws_pda_bg : 86RText {
			idc = -1;
			x = 0.0375 * safezoneW + safezoneX;
			y = 0.515 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.28 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class PO3_HUDsettings_pda : PO3_img_pda {
			idc = -1;
		};
	};

	class controls {
		class PO3_ncws_pda_button_F1 : 86RButtonEmpty {
			idc = -1;
			onButtonClick = "";
			tooltip = "Main Menu"; //--- ToDo: Localize;
			text = "F1"; //--- ToDo: Localize;
			x = 0.025 * safezoneW + safezoneX;
			y = 0.85 * safezoneH + safezoneY;
			w = 0.03125 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_ncws_pda_button_F2 : 86RButtonEmpty {
			idc = -1;
			onButtonClick = "";//closeDialog 0; createDialog ""PO3_player_squadMod"";
			text = "F2"; //--- ToDo: Localize;
			tooltip = "Squad Mod"; //--- ToDo: Localize;
			x = 0.025 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.03125 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_ncws_pda_button_F3 : 86RButtonEmpty {
			idc = -1;
			onButtonClick = "";
			text = "F3"; //--- ToDo: Localize;
			tooltip = "Function 3"; //--- ToDo: Localize;
			x = 0.0625 * safezoneW + safezoneX;
			y = 0.91 * safezoneH + safezoneY;
			w = 0.03125 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_ncws_pda_button_F4 : 86RButtonEmpty {
			idc = -1;
			onButtonClick = "";
			text = "F4"; //--- ToDo: Localize;
			tooltip = "Function 4"; //--- ToDo: Localize;
			x = 0.1125 * safezoneW + safezoneX;
			y = 0.91 * safezoneH + safezoneY;
			w = 0.03125 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_ncws_pda_button_F5: 86RButtonEmpty {
			idc = -1;
			onButtonClick = "";
			text = "F5"; //--- ToDo: Localize;
			tooltip = "Function 5"; //--- ToDo: Localize;
			x = 0.15 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_ncws_pda_button_F6 : 86RButtonEmpty {
			idc = -1;
			onButtonClick = "closeDialog 0";
			text = "F6"; //--- ToDo: Localize;
			tooltip = "Close PDA Interface";
			x = 0.15 * safezoneW + safezoneX;
			y = 0.85 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_player_HUDsettings_title : 86RText {
			shadow = 0;
			idc = PO3CNTRL_16;
			colorBackground[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, 1};
			text = $STR_PO3_DIALOG_GRAPHIC_VIEWTITLE;
			x = 0.0375 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_player_HUDsettings_Tbnr : 86RText {
			colorBackground[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, GUI_BCG_RGB_A};
			idc = 0;
			shadow = 0;
			text = $STR_PO3_DIALOG_GRAPHIC_TERRTITLE;
			x = 0.0375 * safezoneW + safezoneX;
			y = 0.6 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_player_HUDsettings_Hbnr : 86RText {
			colorBackground[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, GUI_BCG_RGB_A};
			idc = 1;
			shadow = 0;
			text = "HUD Settings"; //--- ToDo: Localize;
			x = 0.0375 * safezoneW + safezoneX;
			y = 0.708 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_player_HUDsettings_VDslider : 86RXSliderH {
			idc = 2;
			onSliderPosChanged = "call PO3_fnc_GUI_settings_slider";
			tooltip = $STR_PO3_DIALOG_GRAPHIC_VIEWDESCR;
			x = 0.0375 * safezoneW + safezoneX;
			y = 0.574 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_player_HUDsettings_VDtext : 86RText {
			idc = 3;
			text = "";
			x = 0.0375 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_player_HUDsettings_Buttonultra : 86RButtonX {
			idc = 4;
			text = $STR_PO3_TEXT_ULTRA;
			tooltip = "Massive Grass Radius";
			action = "setTerrainGrid 3.125";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			x = 0.04 * safezoneW + safezoneX;
			y = 0.624 * safezoneH + safezoneY;
			w = 0.035 * safezoneW;
			h = 0.08 * safezoneH;
		};
		class PO3_player_HUDsettings_Buttonhigh : 86RButtonX {
			idc = 5;
			text = $STR_PO3_TEXT_HIGH;
			tooltip = "Large Grass Radius";
			action = "setTerrainGrid 6.25";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			x = 0.07625 * safezoneW + safezoneX;
			y = 0.624 * safezoneH + safezoneY;
			w = 0.05125 * safezoneW;
			h = 0.024 * safezoneH;
		};
		class PO3_player_HUDsettings_Buttonmedium : 86RButtonX {
			idc = 6;
			text = $STR_PO3_TEXT_MED;
			tooltip = "Default Grass Radius";
			action = "setTerrainGrid 12.5";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			x = 0.07625 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.05125 * safezoneW;
			h = 0.026 * safezoneH;
		};
		class PO3_player_HUDsettings_Buttonlow : 86RButtonX {
			idc = 7;
			text = $STR_PO3_TEXT_LOW;
			tooltip = "Low Grass Radius";
			action = "setTerrainGrid 25";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			x = 0.07625 * safezoneW + safezoneX;
			y = 0.678 * safezoneH + safezoneY;
			w = 0.05125 * safezoneW;
			h = 0.026 * safezoneH;
		};
		class PO3_player_HUDsettings_Buttonoff : 86RButtonX {
			idc = 8;
			text = $STR_PO3_TEXT_OFF;
			tooltip = "No Grass";
			action = "setTerrainGrid 50";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.624 * safezoneH + safezoneY;
			w = 0.0325 * safezoneW;
			h = 0.08 * safezoneH;
		};
		class PO3_player_HUDsettings_Button3dnames : 86RButtonX {
			idc = 9;
			text = $STR_PO3_TEXT_3DHUD;
			tooltip = "Toggle 3D Player Names";
			onButtonClick = "[] call PO3_fnc_world2Screen_toggle";
			x = 0.04 * safezoneW + safezoneX;
			y = 0.734 * safezoneH + safezoneY;
			w = 0.11875 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_player_HUDsettings_Button2dnames : 86RButtonX {
			idc = 10;
			text = $STR_PO3_TEXT_2DHUD;
			tooltip = "Toggle Cursortarget Names";
			onButtonClick = "[] call PO3_fnc_cursortoscreen_toggle";
			x = 0.04 * safezoneW + safezoneX;
			y = 0.758 * safezoneH + safezoneY;
			w = 0.11875 * safezoneW;
			h = 0.02 * safezoneH;
		};
	};
};


/* class PO3_player_squadMod {
	idd = PO3CNTRL_03;
	movingEnable = false;
	enableSimulation = true;
	onload = "_this spawn PO3_fnc_squadmod_init;";

	class controlsBackground {
		class PO3_squadmod_tab_bg : 86RText {
			idc = 0;
			x = 0.204688 * safezoneW + safezoneX;
			y = 0.2025 * safezoneH + safezoneY;
			w = 0.590625 * safezoneW;
			h = 0.595 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class PO3_squadmod_tab : PO3_img_tablet {
			idc = 1;
		};
		class PO3_squadmod_Frame : 86RFrame {
			idc = 2;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.575 * safezoneW;
			h = 0.52 * safezoneH;
		};
	};

	class controls {
		class PO3_squadmod_title : 86RText {
			idc = 3;
			text = "Network Centric Warfare Terminal | Squad Modification";
			x = 0.21 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.55 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_squadmod_footer : 86RText {
			idc = 4;
			text = "| F1: None | F2: None | F3: None | F4: None | F5: None | F6: None |"; //--- ToDo: Localize;
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.575 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_squadmod_B_close : 86RButton {
			idc = 5;
			text = "X";
			tooltip = $STR_PO3_TEXT_CLOSE;
			onButtonClick = "closeDialog 0;";
			w = "0.0154688 * safezoneW";
			h = "0.022 * safezoneH";
			x = "0.773281 * safezoneW + safezoneX";
			y = "0.214 * safezoneH + safezoneY";
		};
		class PO3_squadmod_B_Button_F1 : 86RButtonEmpty {
			idc = 6;
			text = "F1"; //--- ToDo: Localize;
			tooltip = "Function 1";
			onButtonClick = "";
			x = 0.3175 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_F2 : 86RButtonEmpty {
			idc = 7;
			text = "F2"; //--- ToDo: Localize;
			tooltip = "Function 2";
			onButtonClick = "";
			x = 0.345 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_F3 : 86RButtonEmpty {
			idc = 8;
			text = "F3"; //--- ToDo: Localize;
			tooltip = "Function 3";
			onButtonClick = "";
			x = 0.3725 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_F4 : 86RButtonEmpty {
			idc = 9;
			text = "F4"; //--- ToDo: Localize;
			tooltip = "Function 4";
			onButtonClick = "";
			x = 0.4 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_F5 : 86RButtonEmpty {
			idc = 10;
			text = "F5"; //--- ToDo: Localize;
			tooltip = "Function 5";
			onButtonClick = "";
			x = 0.4275 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_F6 : 86RButtonEmpty {
			idc = 11;
			text = "F6"; //--- ToDo: Localize;
			tooltip = "Function 6";
			onButtonClick = "";
			x = 0.455 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_FX : 86RButtonEmpty {
			idc = 12;
			text = "X"; //--- ToDo: Localize;
			tooltip = $STR_PO3_TEXT_CLOSE;
			onButtonClick = "closeDialog 0;";
			x = 0.4875 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_B1 : 86RButtonEmpty {
			idc = 13;
			text = "FN"; //--- ToDo: Localize;
			tooltip = "Function";
			onButtonClick = "";
			x = 0.5175 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_B2 : 86RButtonEmpty {
			idc = 14;
			text = "CMD"; //--- ToDo: Localize;
			tooltip = "Command Module";
			onButtonClick = "";
			x = 0.545 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_B3 : 86RButtonEmpty {
			idc = 15;
			text = "CSN"; //--- ToDo: Localize;
			tooltip = "Squad Callsigns";
			onButtonClick = "";
			x = 0.5725 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_B4 : 86RButtonEmpty {
			idc = 16;
			text = "ENV"; //--- ToDo: Localize;
			tooltip = "Environmental";
			onButtonClick = "";
			x = 0.6 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_B5 : 86RButtonEmpty {
			idc = 17;
			text = "SAT"; //--- ToDo: Localize;
			tooltip = "Geo Satellite Image";
			onButtonClick = "";
			x = 0.645 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class PO3_squadmod_B_Button_B6: 86RButtonEmpty {
			idc = 18;
			text = "SPT"; //--- ToDo: Localize;
			tooltip = "Support Module";
			onButtonClick = "";
			x = 0.7175 * safezoneW + safezoneX;
			y = 0.828 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
		};


// =========================================================================================================
//	Main Commander Screen
// =========================================================================================================
		class PO3_squadmod_TextPlayers : 86RText {
			idc = 19;
			text = $STR_PO3_TEXT_PLAYERS;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_squadmod_ListPlayers : 86RListBox {
			idc = 20;
			onLBSelChanged = "_this call PO3_fnc_sqdmod_selectUnit;";
			x = 0.225 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class PO3_squadmod_Button_TextLeaders : 86RText {
			idc = 21;
			text = $STR_PO3_TEXT_LEADERS;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PO3_squadmod_ListGroups : 86RListBox {
			idc = 22;
			onLBSelChanged = "_this call PO3_fnc_sqdmod_selectGroup;";
			x = 0.475 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class PO3_squadmod_EditGroup: 86REdit {
			idc = 23;
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_EditGroup : 86RButton {
			idc = 24;
			text = $STR_PO3_TEXT_RENAME;
			onButtonClick = "_this call PO3_fnc_sqdmod_editGroup";
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.280 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_NewGroup : 86RButtonX {
			idc = 25;
			text = $STR_PO3_NEWGROUP;
			onButtonClick = "_this call PO3_fnc_sqdmod_newGroup;";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.280 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_JoinGroup : 86RButtonX {
			idc = 26;
			text = $STR_PO3_JOINGROUP;
			onButtonClick = "_this call PO3_fnc_sqdmod_joinGroup;";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.311 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_MakeLeader : 86RButtonX {
			idc = 27;
			text = $STR_PO3_MAKELEADER;
			onButtonClick = "_this call PO3_fnc_sqdmod_makeLeader;";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.342 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_assign2: 86RText {
			idc = 29;
			text = $STR_PO3_ASSIGNEEROLE;
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.404 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_assign1 : 86RCombo {
			idc = 28;
			onLBSelChanged = "_this call PO3_fnc_sqdmod_assignRole;";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.435 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_assign5 : 86RButtonX {
			idc = 34;
			text = "Driver";
			onButtonClick = "['driver'] spawn PO3_fnc_sqdmod_assignLicense;";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.4660 * safezoneH + safezoneY;
			w = 0.053 * safezoneW;
			h = 0.0300 * safezoneH;
		};
		class PO3_squadmod_Button_assign6 : 86RButtonX {
			idc = 35;
			onButtonClick = "['pilot'] spawn PO3_fnc_sqdmod_assignLicense;";
			text = "Pilot";
			x = 0.4165 * safezoneW + safezoneX;
			y = 0.4660 * safezoneH + safezoneY;
			w = 0.0531 * safezoneW;
			h = 0.0300 * safezoneH;
		};
		class PO3_squadmod_Button_assign3 : 86RButtonX {
			idc = 30;
			onButtonClick = "[""UAV""] spawn PO3_fnc_sqdmod_requestUAS;";
			text = $STR_PO3_REQUESTUAV;
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_assign4 : 86RButtonX {
			idc = 31;
			onButtonClick = "[""UGV""] spawn PO3_fnc_sqdmod_requestUAS;";
			text = $STR_PO3_REQUESTUGV;
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.559 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_skipMission : 86RButtonX {
			idc = 32;
			onButtonClick = "";//_this call PO3_fnc_skipTask;
			text = $STR_PO3_SKIPTASK;
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.10625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class PO3_squadmod_Button_Close: 86RButtonX {
			idc = 33;
			text = $STR_PO3_TEXT_CLOSE;
			onButtonClick = "closeDialog 0;";
			x = 0.65 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.03 * safezoneH;
		};
	};
}; */

//#include <mod\ncws\dialog.hpp>
//#include <mod\logistics\dialog.hpp>
