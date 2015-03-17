scriptName "PO3\fnc\camera\fn_camera_path.sqf";
/*
	Author: Eightysix

	Description:
	Returns Marker Type of the type vehicle the unit or group is operating.

	Syntax:
	_Type = (unit/group/vehicle) call PO3_fnc_getObjectMarkerType;

	Example:
	_Type = (player) call PO3_fnc_getObjectMarkerType;
	_Type = (vehicle player) call PO3_fnc_getObjectMarkerType;
*/
private["_points","_position","_target","_time","_border","_fov","_destroy"];

_points = _this;

if(!isNil "PO3_player_camera") then { WaitUntil{camCommitted PO3_player_camera}; };

BIS_DEBUG_CAM = true;
cameraEffectEnableHUD true;

private ["_ppColor","_ppGrain"];
_ppColor = ppEffectCreate ["colorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.8, 0.8, 0.8, 0.65], [1, 1, 1, 1.0]];
_ppColor ppEffectCommit 0;
_ppGrain = ppEffectCreate ["filmGrain", 2012];
_ppGrain ppEffectEnable true;
_ppGrain ppEffectAdjust [0.1, 1, 1, 0, 1];
_ppGrain ppEffectCommit 0;

{
	_position	= (_x select 0) call PO3_fnc_getPos;
	_target		= if(typename (_x select 1) == "OBJECT") then { vehicle (_x select 1) }else{ (_x select 1) call PO3_fnc_getPos };
	_time		= _x select 2;
	_fov		= if(count _x > 3) then { _x select 3 }else{ 0.4 };
	_border		= if(count _x > 4) then { _x select 4 }else{ false };
	_destroy	= if(count _x > 5) then { _x select 5 }else{ true };

	if(isNil "PO3_player_camera") then {
		if(PO3_a3) then {
			("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];
			("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];
		};

		PO3_player_camera = "camera" camCreate (_position);
		PO3_player_camera cameraEffect ["internal","back"];
		_time = 0;
	};

	PO3_player_camera camSetPos _position;
	PO3_player_camera camSetTarget _target;
	PO3_player_camera camSetFOV _fov;
	PO3_player_camera camCommit _time;
	showcinemaborder _border;

	WaitUntil{camCommitted PO3_player_camera && time > 0};

}forEach _points;

WaitUntil{camCommitted PO3_player_camera};

ppEffectDestroy _ppColor;
ppEffectDestroy _ppGrain;

if(_destroy && !isNil "PO3_player_camera") then {

	if(PO3_a3) then {
		("BIS_layerEstShot"call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
		("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
	};

	camDestroy PO3_player_camera;
	player cameraEffect ["terminate","back"];
	BIS_DEBUG_CAM = nil;
	PO3_player_camera = nil;
};