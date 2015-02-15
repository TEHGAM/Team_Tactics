/*
	Author: Eightysix

	Description:

	Syntax:

	Example:
*/

#define PO3_HUDSettings_TBNR (uiNamespace getVariable "PO3_HUDSettings_Tbnr")
#define PO3_HUDSettings_HBNR (uiNamespace getVariable "PO3_HUDSettings_Hbnr")
#define PO3_HUDSettings_VDSL (uiNamespace getVariable "PO3_HUDSettings_VDslider")
#define PO3_HUDSettings_VDST (uiNamespace getVariable "PO3_HUDSettings_VDtext")

_distance	= _this select 1;

setViewDistance (round _distance);
PO3_HUDSettings_VDST ctrlSetText format[localize "STR_PO3_DIALOG_GRAPHIC_VIEWDIST",(round viewdistance)];