/*
	Author: Eightysix

	Description:

*/
private["_changer","_effsleep"];

if(!isNil "PO3_effect_video_blur") then { ppEffectDestroy PO3_effect_video_blur; PO3_effect_video_blur = nil; };
if(!isNil "PO3_effect_video_colour") then { ppEffectDestroy PO3_effect_video_colour; PO3_effect_video_colour = nil; };
if(!isNil "PO3_effect_video_grain") then { ppEffectDestroy PO3_effect_video_grain; PO3_effect_video_grain = nil; };

if(PO3_a3) then {
	("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];
};

PO3_effect_video_blur = ppEffectCreate ["DynamicBlur", 450];
PO3_effect_video_blur ppEffectEnable true;
PO3_effect_video_blur ppEffectAdjust [0.6+random 0.4];
PO3_effect_video_blur ppEffectCommit 2;

PO3_effect_video_colour = ppEffectCreate ["ColorCorrections", 1587];
PO3_effect_video_colour ppEffectEnable true;
PO3_effect_video_colour ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.8, 0.8, 0.8, 0.65], [1, 1, 1, 1.0]];
PO3_effect_video_colour ppEffectCommit 2;

PO3_effect_video_grain = ppEffectCreate ["filmGrain", 2012];
PO3_effect_video_grain ppEffectEnable true;
PO3_effect_video_grain ppEffectAdjust [0.1, 1, 1, 0, 1];
PO3_effect_video_grain ppEffectCommit 0;

sleep 2;

_changer = [] spawn {
	while {true} do {
		PO3_effect_video_blur ppEffectAdjust [0.8+random 0.2];
		PO3_effect_video_blur ppEffectCommit (random 1.5);
		sleep (1.5+random 2);
	};
};

waitUntil{PO3_player_respawned};

terminate _changer;

if(PO3_a3) then {
	("BIS_layerEstShot"call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
};

ppEffectDestroy PO3_effect_video_blur;
ppEffectDestroy PO3_effect_video_colour;
ppEffectDestroy PO3_effect_video_grain;