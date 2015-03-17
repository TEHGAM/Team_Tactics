// Spectating Script by Kegetys
#define BORDERSIZE		0.06
#define BORDERXSIZE		0.015
#define CMENUWIDTH		0.19
#define TMENUWIDTH		0.200
#define MENUHEIGHT		0.30
#define MAPWIDTH		0.3
#define MAPHEIGHT		0.30
#define MAPTXTSIZE		0.02
#define ELOGWIDTH		SafeZoneW - 0.1
#define ELOGHEIGHT		0.0
#define IDC_MAIN		55001
#define IDC_CAMERA		55002
#define IDC_TARGET		55003
#define IDC_NAME		55004
#define IDC_MENUCAM		55005
#define IDC_MENUTGT		55006
#define IDC_MENUCAMB		55007
#define IDC_MENUTGTB		55008
#define IDC_BG1			55009
#define IDC_BG2			55010
#define IDC_TITLE		55011
#define IDC_HELP		55012
#define IDC_MAP			55013
#define IDC_MAPFULL		55014
#define IDC_MAPFULLBG		55015
#define IDC_EVENTLOG		50016
#define IDC_DEBUG		55100
#define IDC_BIRDMAP		50017
#define COL_ORANGE		{1, 0.5, 0, 1}
#define COL_GRAY		{0.2, 0.2, 0.2, 1}

class KEGsRscText : 86RText {
	idc = -1;
	w = 0.1;
	h = 0.05;
	sizeEx = 0.04;
	text = "";
};

class KEGsRscListBox : 86RListBox {
	access = ReadAndWrite;
	w = 0.4;
	h = 0.4;
	sizeEx = 0.04;
};
class KEGsRscActiveText : 86RActiveText {
	h = 0.05;
	w = 0.15;
	sizeEx = 0.04;
};

class KEGsRscMapControl : 86RMap {
	access = ReadAndWrite;
	type = 101;
	idc = 51;
	style = 48;
	sizeEx = 0.04;

};

class KEGsRscControlsGroup : 86RControlsGroup {
	type = 15;
	idc = -1;
	style = 0;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	class VScrollbar {
		width = 0.021;	
	};
	class HScrollbar {
		height = 0.028;	
	};
	class Controls {};
};

class RscSpectate {
	idd = IDC_MAIN;
	movingEnable = false;
	class controls {
		class mouseHandler: 86RControlsGroup {
			onMouseMoving = "[""MouseMoving"",_this] call spectate_events";
			onMouseButtonDown = "[""MouseButtonDown"",_this] call spectate_events";
			onMouseButtonUp = "[""MouseButtonUp"",_this] call spectate_events";
			onMouseZChanged = "[""MouseZChanged"",_this] call spectate_events";
			idc = 123;
			x = SafeZoneX; y = SafeZoneY;
			w = SafeZoneW; h = SafeZoneH;
		};
		class BackgroundTop: 86RText {
			idc = IDC_BG1;
			x = SafeZoneXAbs; y = SafeZoneY;
			w = SafeZoneWAbs; h = BORDERSIZE;
			colorBackground[] = {0, 0, 0, 1};
		};
		class BackgroundBottom: BackgroundTop {
			idc = IDC_BG2;
			y = SafeZoneY + SafeZoneH-BORDERSIZE;
		};
		class title : BackgroundTop {
			idc = IDC_TITLE;
			colorBackground[] = {0, 0, 0, 0};
			text = "$STR_MISSION_NAME";
			style = 2;
			sizeEx = 0.035;
			colorText[] = {1, 0, 0, 1};
			shadow = true;
			y = SafeZoneY;
			h = BORDERSIZE;
			x = SafeZoneX;
			w = SafeZoneW;
		};
		class menuCameras : 86RText {
			idc = IDC_MENUCAMB;
			style = ST_HUD_BACKGROUND;
			x = SafeZoneX + BORDERXSIZE;y = SafeZoneY + BORDERSIZE;
			w = CMENUWIDTH;h = MENUHEIGHT;
			text = "";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class menuCamerasLB : 86RListBox {
			onLBSelChanged = "_this call KEGs_menucamslbchange";
			maxHistoryDelay=1;
			idc = IDC_MENUCAM;
			x = SafeZoneX + BORDERXSIZE;y = SafeZoneY + BORDERSIZE;
			w = CMENUWIDTH;h = MENUHEIGHT;
			sizeEx = 0.025;
		};
		class menuTargets : 86RText {
			idc = IDC_MENUTGTB;
			style = ST_HUD_BACKGROUND;
			x = SafeZoneX + SafeZoneW-BORDERXSIZE-TMENUWIDTH;
			y = SafeZoneY + BORDERSIZE;
			w = TMENUWIDTH;	h = MENUHEIGHT;
			text = "";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class menuTargetsLB : 86RListBox {
			maxHistoryDelay=1;
			idc = IDC_MENUTGT;
			x = SafeZoneX + SafeZoneW-BORDERXSIZE-TMENUWIDTH;
			y = SafeZoneY + BORDERSIZE;
			w = TMENUWIDTH;	h = MENUHEIGHT;
			sizeEx = 0.025;
			period = 0;
		};
		class tCamera : 86RActiveText {
			idc = IDC_CAMERA;
			x = SafeZoneX + BORDERXSIZE; y = SafeZoneY;	w = SafeZoneW-(2*BORDERXSIZE); h = BORDERSIZE;
			text = "Camera";
			style = 0;
			sizeEx = 0.025;
			color[] = {1, 1, 1, 0.9};
			shadow = true;
			onMouseButtonUp = "[""ToggleCameraMenu"",0] call spectate_events";
		};
		class tTarget : tCamera {
			idc = IDC_TARGET;
			text = "Target";
			style = 1;
			onMouseButtonUp = "[""ToggleTargetMenu"",0] call spectate_events";
		};
		class tName : 86RText {
			idc = IDC_NAME;
			x = SafeZoneX + BORDERXSIZE;y = SafeZoneY + SafeZoneH-BORDERSIZE; w = SafeZoneW-(BORDERXSIZE); h = BORDERSIZE;
			text = "Unknown";
			style = 0;
			sizeEx = 0.015;
			colorText[] = {1, 1, 1, 0.9};
		};
		class tHelp : 86RText {
			type = 13;
			idc = IDC_HELP;
			x = SafeZoneX + BORDERXSIZE*3;y=SafeZoneY + BORDERSIZE*3; w = SafeZoneW-(2*BORDERXSIZE*3); h = SafeZoneH-(2*BORDERSIZE*2);
			text = "Click at the camera/target text at the top to open camera/target menus.<br/>Units on the map can be clicked to target them<br/><br/>Keyboard controls:<br/>A/D - Previous/Next target<br/>W/S - Previous/Next camera<br/>1-5 - Direct camera change<br/>N - 3D view: Toggle night vision on/off<br/>N - Full map: Toggle marker text off/names/types<br/>T - Toggle unit tags on/off<br/>F - Toggle AI filter on/off<br/>G - Toggle Group/Formation Leader filter on/off<br/>H - Toggle Map Markers Updates on/off<br/>Tab - Toggle UI on/off<br/>M - Toggle map on/full/off<br/>Numpad plus/minus - Increase/decrease full map marker size<br/>Space - Drop camera (W,S,A,D keys = movement)<br/>Space - Toggle gunsight (1st person view)<br/>Esc - Butterfly mode<br/><br/>Mouse controls:<br/>Right button - Rotate camera (free camera mode only)<br/>Left button - Move camera<br/>Left and right button - Zoom";
			style = 2;
			sizeEx = 0.025;
			size = 0.025;
			colorText[] = {1, 1, 1, 1};
			color[] = {0, 0, 0, 1};
			class Attributes{
				color = "#ffffff";
				align = "left";
				shadow = true;
			};
		};
		class tDebug : tCamera {
			idc = IDC_DEBUG;
			text = "";
			style = 2;
			x = SafeZoneX; y = SafeZoneY;
			w = SafeZoneW; h = SafeZoneH;
			action ="";
		};
		class map : KEGsRscMapControl {
			maxSatelliteAlpha = 0;
			alphaFadeStartScale = 1;
			alphaFadeEndScale = 1.1;
			idc = IDC_MAP;
			x = SafeZoneX + SafeZoneW-MAPWIDTH; y = SafeZoneY + SafeZoneH-MAPHEIGHT;
			w = MAPWIDTH; h = MAPHEIGHT;
			sizeExLabel = MAPTXTSIZE;
			sizeExGrid = MAPTXTSIZE;
			sizeExUnits = MAPTXTSIZE;
			sizeExNames = MAPTXTSIZE;
			sizeExInfo = MAPTXTSIZE;
			sizeExLevel = MAPTXTSIZE;
			showCountourInterval = "false";
			onMouseZChanged = "[""MouseZChangedminimap"",_this] call spectate_events";
		};
		class mapFullBG : BackgroundTop {
			idc = IDC_MAPFULLBG;
			x = SafeZoneX;y=SafeZoneY;
			w = SafeZoneW;h=SafeZoneH;
			colorBackground[] = {0, 0, 0, 1};
		};
		class mapFull : 86RMap {
			colorOutside[] = {0,0,0,1};
			colorRailWay[] = {0,0,0,1};
			maxSatelliteAlpha = 0;
			alphaFadeStartScale = 1;
			alphaFadeEndScale = 1.1;
			showCountourInterval = "true";
			idc = IDC_MAPFULL;
			x = SafeZoneXAbs;y=SafeZoneY + BORDERSIZE;
			w = SafeZoneWAbs;h=SafeZoneH-(BORDERSIZE*2);
			colorBackground[] = {0.85, 0.85, 0.85, 1};
		};
		class mapFullEventLog : 86RListBox {
			idc = IDC_EVENTLOG;
			x = SafeZoneX;	y = SafeZoneH-ELOGHEIGHT;
			w = ELOGWIDTH;h = ELOGHEIGHT;
			sizeEx = 0.021;
		};
	};
};

class RscSpectateBirdMap {
	idd = IDC_BIRDMAP;
	movingEnable = false;
	class controls {
		class map : KEGsRscMapControl {
			maxSatelliteAlpha = 0;
			alphaFadeStartScale = 1;
			alphaFadeEndScale = 1.1;
			idc = IDC_MAP;
			x = SafeZoneX + SafeZoneW-MAPWIDTH; y = SafeZoneY + SafeZoneH-MAPHEIGHT;
			w = MAPWIDTH; h = MAPHEIGHT;
			sizeExLabel = MAPTXTSIZE;
			sizeExGrid = MAPTXTSIZE;
			sizeExUnits = MAPTXTSIZE;
			sizeExNames = MAPTXTSIZE;
			sizeExInfo = MAPTXTSIZE;
			sizeExLevel = MAPTXTSIZE;
		};
		class BackgroundTop: 86RText {
			idc = IDC_BG1;
			x = SafeZoneXAbs; y = SafeZoneY;
			w = SafeZoneWAbs; h = BORDERSIZE+1;
			colorBackground[] = {0, 0, 0, 1};
		};
		class mapFullBG : BackgroundTop {
			idc = IDC_MAPFULLBG;
			x = SafeZoneXAbs;y= SafeZoneY;
			w = SafeZoneWAbs;h= SafeZoneH;
			colorBackground[] = {0, 0, 0, 1};
		};
		class mapFull : 86RMap {
			colorOutside[] = {0,0,0,1};
			colorRailWay[] = {0,0,0,1};
			maxSatelliteAlpha = 0;
			alphaFadeStartScale = 1;
			alphaFadeEndScale = 1.1;
			showCountourInterval = "true";
			idc = IDC_MAPFULL;
			x = SafeZoneXAbs;y=SafeZoneY + BORDERSIZE;
			w = SafeZoneWAbs;h=SafeZoneH-(BORDERSIZE*2);
			colorBackground[] = {0.85, 0.85, 0.85, 1};
		};
	};
};