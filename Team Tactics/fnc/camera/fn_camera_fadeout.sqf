scriptName "PO3\fnc\camera\fn_camera_fadeout.sqf";
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
private["_countthis","_text","_time"];

_countthis = count _this;

_time = if( _countthis > 0 ) then { _this select 0 }else{ 5 };
_text = if( _countthis > 1 ) then { _this select 1 }else{ "" };

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 0;

"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit _time;

121 cuttext [ _text,"BLACK OUT",_time];

("BIS_layerEstShot"call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
sleep _time;

"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 0;
