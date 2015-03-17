/*
	Author: Eightysix

	Description:
	Returns Marker Colour of the side of the unit or group.

	Syntax:
	_colour = (unit/group) call PO3_fnc_getUnitMarkerColour;

	Example:
	_colour = (player) call PO3_fnc_getUnitMarkerColour;
	_colour = (group player) call PO3_fnc_getUnitMarkerColour;
*/
private["_side","_colour"];

if(isNil "PO3_a3") then { PO3_a3 = false };

_side = switch (typename _this) do {
	case "SIDE" : { _this };
	case "GROUP" : { side( _this )  };
	case "OBJECT" : { side( group _this ) };
	default { civilian };
};

_colour = switch (_side) do {
	case east : { "ColorOPFOR" };
	case west : { "ColorBLUFOR" };
	case resistance : { "ColorIndependent" };
	case civilian : { "ColorWhite" };
	default { "ColorBlack" };
};

_colour;