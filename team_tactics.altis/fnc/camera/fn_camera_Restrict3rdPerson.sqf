scriptName "PO3\fnc\camera\fn_camera_Restrict3rdPerson.sqf";
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
private["_restrict_nvgs","_restrict_walkr","_restrict_drivr","_restrict_cargo","_view_allowed","_view_restricted","_walker","_driver","_crew","_restricted"];

if(isNil "PO3_param_camera_restrict_nvg") then { PO3_param_camera_restrict_nvg = false };
if(isNil "PO3_param_camera_restrict_3dvwalker") then { PO3_param_camera_restrict_3dvwalker = false };
if(isNil "PO3_param_camera_restrict_3dvdriver") then { PO3_param_camera_restrict_3dvdriver = false };
if(isNil "PO3_param_camera_restrict_3dvcrewmn") then { PO3_param_camera_restrict_3dvcrewmn = false };

if(
	!PO3_param_camera_restrict_nvg
	&& !PO3_param_camera_restrict_3dvwalker
	&& !PO3_param_camera_restrict_3dvdriver
	&& !PO3_param_camera_restrict_3dvcrewmn
) exitWith {};

_restricted = false;
_view_allowed = "INTERNAL";
_view_restricted = ["EXTERNAL","GROUP"];
_restrict_nvgs	= PO3_param_camera_restrict_nvg;
_restrict_walkr	= PO3_param_camera_restrict_3dvwalker;
_restrict_drivr	= PO3_param_camera_restrict_3dvdriver;
_restrict_cargo	= PO3_param_camera_restrict_3dvcrewmn;

while {true} do {
	waitUntil {alive player};
	if( cameraView IN _view_restricted ) then {
		_walker	= if(vehicle player == player && driver vehicle player == player) then { _restrict_walkr }else{ false };
		_driver	= if(vehicle player != player && driver vehicle player == player) then { _restrict_drivr }else{ false };
		_crew	= if(vehicle player != player && driver vehicle player != player) then { _restrict_cargo }else{ false };

		_restricted = if( _walker || _driver || _crew ) then { true }else{ false };

		if( _restricted) then {
			(vehicle player) switchCamera _view_allowed;
			["External Camera is faulty and cannot be used"] call PO3_fnc_hints;
		};
	};
	sleep 0.1;
};