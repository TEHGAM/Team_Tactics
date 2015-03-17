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

_side = switch (typename _this) do {
	case "SIDE" : { _this };
	case "GROUP" : { side( _this )  };
	case "OBJECT" : { side( group _this ) };
	default { civilian };
};

_colour = switch (_side) do {
	case east : { [(profilenamespace getvariable ['Map_OPFOR_R',0]),(profilenamespace getvariable ['Map_OPFOR_G',1]),(profilenamespace getvariable ['Map_OPFOR_B',1]),(profilenamespace getvariable ['Map_OPFOR_A',0.8])] };
	case west : { [(profilenamespace getvariable ['Map_BLUFOR_R',0]),(profilenamespace getvariable ['Map_BLUFOR_G',1]),(profilenamespace getvariable ['Map_BLUFOR_B',1]),(profilenamespace getvariable ['Map_BLUFOR_A',0.8])] };
	case resistance : { [(profilenamespace getvariable ['Map_Independent_R',0]),(profilenamespace getvariable ['Map_Independent_G',1]),(profilenamespace getvariable ['Map_Independent_B',1]),(profilenamespace getvariable ['Map_Independent_A',0.8])] };
	case civilian : { [(profilenamespace getvariable ['Map_Civilian_R',0]),(profilenamespace getvariable ['Map_Civilian_G',1]),(profilenamespace getvariable ['Map_Civilian_B',1]),(profilenamespace getvariable ['Map_Civilian_A',0.8])] };
	default { [(profilenamespace getvariable ['Map_Unknown_R',0]),(profilenamespace getvariable ['Map_Unknown_G',1]),(profilenamespace getvariable ['Map_Unknown_B',1]),(profilenamespace getvariable ['Map_Unknown_A',0.8])] };
};

_colour;