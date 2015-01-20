// =========================================================================================================
// !!  DO NOT MODIFY THIS FILE  !!
// =========================================================================================================

class PO3_ProgressBar {
	idd = -1;
	movingEnable = 0;
	objects[] = {};
	duration = 1e+011;
	name = "PO3_ProgressBar";
	onload = "_this call PO3_fnc_progressBar_init;";

	class controlsBackground {
		class PO3_progressbar_background : 86RText {
			idc = 0;
			x = "0.298906 * safezoneW + safezoneX";
			y = "0.082 * safezoneH + safezoneY";
			w = "0.407344 * safezoneW";
			h = "0.011 * safezoneH";
			colorBackground[] = {0,0,0,0.7};
		};
	};
	class controls {
		class PO3_progressbar_foreground : 86RText {
			colorBackground[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, GUI_BCG_RGB_A};
			idc = 1;
			x = "0.298906 * safezoneW + safezoneX";
			y = "0.082 * safezoneH + safezoneY";
			w = "0.001 * safezoneW";
			h = "0.011 * safezoneH";
		};
		class PO3_progressbar_text : 86RStructuredText {
			idc = 2;
			colorBackground[] = {0,0,0,0};
			x = "0.298906 * safezoneW + safezoneX";
			y = "0.093 * safezoneH + safezoneY";
			w = "0.407344 * safezoneW";
			h = "0.022 * safezoneH";
			text = "Progress:";
			class Attributes {
				align = "left";
				font = GUI_FONT_MONO;
				shadow = 1;
			};
		};
	};
};

class PO3_screentext_sitrep {
	idd = -1;
	movingEnable = 0;
	duration = 1e+011;
	fadein = 0;
	fadeout = 0;
	name = "PO3_screentext_sitrep_ID";
	onload = "_this call PO3_fnc_screentext_init;";

	class controls {
		class sitrep_0 : 86RStructuredText {
			idc = PO3CNTRL_06;
			text = "";
			x = (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX);
			y = ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY);
			w = 1;
			h = 1;
		};
		class sitrep_1: 86RStructuredText {
			idc = PO3CNTRL_07;
			text = "";
			size = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7);";
			x = 0.35;
			y = 0.60;
			w = 0.30;
			h = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7);";
			class Attributes {
				align = "Center";
				font = GUI_FONT_MONO;
				shadow = 1;
			};
		};
	};
};

class PO3_hud_crewlist {
	idd = -1;
	movingEnable = 0;
	duration = 1e+011;
	fadein = 0;
	fadeout = 0;
	name="PO3_hud_crewlist";
	onLoad = "_this call PO3_fnc_crewlist_init";

	class controlsBackground {
		class PO3_hud_crewlist_bg : 86RText {
			idc = PO3CNTRL_08;
			x = "0.84125 * safezoneW + safezoneX";
			y = "0.14 * safezoneH + safezoneY";
			w = "0.1625 * safezoneW";
			h = "0.63 * safezoneH";
			colorBackground[] = {0,0,0,0};
		};
	};

	class controls {
		class PO3_hud_crewlist_text : 86RStructuredText {
			idc = PO3CNTRL_09;
			style = ST_RIGHT;
			x = "0.84125 * safezoneW + safezoneX";
			y = "0.14 * safezoneH + safezoneY";
			w = "0.1625 * safezoneW";
			h = "0.63 * safezoneH";
			size = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7);";
			text ="";
			class Attributes {
				align = "right";
				font = GUI_FONT_MONO;
				shadow = 0;
			};
		};
	};
};

class PO3_HcamDialog {
	idd = -1;
	onLoad = "_this call PO3_fnc_helmetCam_init";
	movingEnable = 0;
	enableSimulation = 1;
	enableDisplay = 1;
	duration = 1e+011;
	fadein = 0;
	fadeout = 0;
	class controls { 
		class RscHcamBack : 86RPicture {
			idc = 2;
			type = 0;
			style = 48;
			text = "data\img_hcam_back.paa";
			x = 0.78 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.22 * safezoneW;
			h = 0.17 * safezoneH;
		};
		class RscHcamCam : 86RPicture {
			idc = 0;
			type = 0;
			style = 48;
			text = "";
			x = 0.80 * safezoneW + safezoneX;
			y = 0.68 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.15 * safezoneH;
		};
		class HcamText : 86Rtext {
			idc = 1;
			type  = 0;
			style = 0x01;
			x = 0.80 * safezoneW + safezoneX;
			y = 0.81 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1, 1, 1, 0.2};
			sizeEx = 0.02;
			text="";
		};
		class RscHcamFront : 86RPicture {
			idc = 3;
			type = 0;
			style = 48;
			text = "data\img_hcam_front.paa";
			x = 0.80 * safezoneW + safezoneX;
			y = 0.68 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.15 * safezoneH;
		};
	};
};

#define PO3_LIFTRADAR_X "(SafeZoneX+SafeZoneW/2) - (5.6 * (((safezoneW / safezoneH) min 1.2) / 40))/2"
#define PO3_LIFTRADAR_Y "( SafeZoneY+SafeZoneH ) - (5.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))*3"

class PO3_LiftChopper_HUD {
	idd = PO3CNTRL_14;
	movingEnable=0;
	duration = 1e+011;
	name = "PO3_LiftChopper_HUD";
	onLoad = "_this call PO3_fnc_liftRadar_init";
	controlsBackground[] = {};
	objects[] = {};

	class controls {
		class PO3_RADAR_bg : 86RPicture {
			idc = 0;
			text = "A3\Ui_f\data\igui\cfg\radar\radarbackground_ca.paa";
			colorText[] = {GUI_BCG_RGB_R, GUI_BCG_RGB_G, GUI_BCG_RGB_B, GUI_BCG_RGB_A};
			x = PO3_LIFTRADAR_X;
			y = PO3_LIFTRADAR_Y;
			w = "5.6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "5.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

		};
		class PO3_RADAR : 86RPicture {
			idc = 1;
			text = "A3\Ui_f\data\igui\cfg\radar\radar_ca.paa";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
			x = PO3_LIFTRADAR_X;
			y = PO3_LIFTRADAR_Y;
			w = "5.6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "5.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PO3_RADAR_Target : 86RPicture {
			idc = 2;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1};
			text = "A3\Ui_f\data\IGUI\Cfg\Cursors\board_ca.paa";
			x = PO3_LIFTRADAR_X;
			y = PO3_LIFTRADAR_Y;
			w = 0.03;
			h = 0.04;
		};
	};
};

class PO3_screentext {
	idd = -1;
	movingEnable = 0;
	duration = 1e+011;
	fadein = 0;
	fadeout = 0;
	name = "PO3_screentext";
	onload = "uinamespace setvariable ['PO3_screentext',_this select 0];";
	onUnload = "uinamespace setvariable ['PO3_screentext',nil];";

	class controls {
		class PO3_Title_Banner : 86RStructuredText {
			idc = PO3CNTRL_08;
			text = "";
			size = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = "safeZoneXAbs";
			y = "0.445 * safezoneH + safezoneY";
			w = "safezoneWAbs";
			h = "0.099 * safezoneH";
			class Attributes {
				align = "Center";
				font = GUI_FONT_MONO;
				shadow = 0;
			};
		};
	};
};

class PO3_RespawnCounter {
	onLoad = "";
	onUnload = "";
	idd = -1;
	duration = 1e+011;
	fadein = 0;
	movingEnable = 0;
	class Controls {
		class MPTable : 86Rtext {
			colorBackground[] = {0,0,0,0};
			idc = 1;
			x = 0.025;
			y = 0.08;
			w = 0.95;
			h = 0.78;
		};
		class TitleBackground : 86Rtext {
			colorBackground[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
			idc = 2;
			x = "13.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "22.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "13 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title : 86Rtext {
			idc = 3;
			x = "13.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "22.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "13 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class PlayerRespawnTime : 86Rtext {
			idc = 4;
			text = "00:00.000";
			x = "16.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "22.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "7 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "1.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Description : 86RStructuredText {
			colorBackground[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
			idc = 5;
			x = "13.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "24.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "13 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};

class RscDeadQuote {
	onload = "uinamespace setvariable ['tcb_ais_title',_this select 0];";
	idd = 1792;
	movingEnable = false;
	moving = false;
	duration=10e10;
	enableSimulation = true;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {QuoteStructuredText,HeaderDeath};

	class HeaderDeath {
		idc = -1;
		type = 13;
		style = 0x00;
		colorBackground[] = {1, 1, 1, 0};
		colorText[] = {1, 0.0, 0.0, 1};
		x = safezoneX + 0.3 * safezoneW;
		y = safezoneY + 0.045 * safezoneW;
		w = 1;
		h = 0.6;
		size = 0.08;
		text = "You are dead.";
		class Attributes {
			font = "PuristaMedium";
			color = "#CC0000";
			align = "center";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "1.6";
		};
	};
	class QuoteStructuredText {
		idc = 1793;
		type = 13;
		style = 0x00;
		colorBackground[] = { 1, 1, 1, 0 };
		colorText[] = {1,1,1,1};
		x = safezoneX + 0.3 * safezoneW;
		y = safezoneY + 0.67 * safezoneW;
		w = 1;
		h = 0.6;
		size = 0.02;
		text = "";
		class Attributes {
			font = "PuristaMedium";
			color = "#000000";
			align = "center";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "1.6";
		};
	};
};