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
disableSerialization;

_display = _this select 0;

uiNamespace setVariable ["PO3_HUDSettings_GUI",	_display ];
uiNamespace setVariable ["PO3_HUDSettings_Tbnr",	_display displayCtrl  0];
uiNamespace setVariable ["PO3_HUDSettings_Hbnr",	_display displayCtrl  1];
uiNamespace setVariable ["PO3_HUDSettings_VDslider",	_display displayCtrl  2];
uiNamespace setVariable ["PO3_HUDSettings_VDtext",	_display displayCtrl  3];
uiNamespace setVariable ["PO3_HUDSettings_BUltra",	_display displayCtrl  4];
uiNamespace setVariable ["PO3_HUDSettings_BHigh",	_display displayCtrl  5];
uiNamespace setVariable ["PO3_HUDSettings_BMed",	_display displayCtrl  6];
uiNamespace setVariable ["PO3_HUDSettings_BLow",	_display displayCtrl  7];
uiNamespace setVariable ["PO3_HUDSettings_BOff",	_display displayCtrl  8];
uiNamespace setVariable ["PO3_HUDSettings_B3DHud",	_display displayCtrl  9];

#define PO3_HUDSettings_TBNR (uiNamespace getVariable "PO3_HUDSettings_Tbnr")
#define PO3_HUDSettings_HBNR (uiNamespace getVariable "PO3_HUDSettings_Hbnr")
#define PO3_HUDSettings_VDSL (uiNamespace getVariable "PO3_HUDSettings_VDslider")
#define PO3_HUDSettings_VDST (uiNamespace getVariable "PO3_HUDSettings_VDtext")

PO3_HUDSettings_VDSL sliderSetRange [500,15000];
PO3_HUDSettings_VDSL sliderSetPosition viewdistance;
PO3_HUDSettings_VDST ctrlSetText format[localize "STR_PO3_DIALOG_GRAPHIC_VIEWDIST",(round viewdistance)];