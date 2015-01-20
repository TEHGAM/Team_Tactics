/*
	Author: Eightysix

	Description:

*/
disableSerialization;

if(isnil "PO3_respawn_positions_list") exitWith { [localize "STR_PO3_RESPWN_NOPOINT"] call PO3_fnc_hintc };

onMapSingleClick "";

_select = (_this select 0) lbValue (lbCurSel (_this select 0) );
_text = (_this select 0) lbtext (lbCurSel (_this select 0) );
_picID = (_this select 0) lbPicture (lbCurSel (_this select 0) );

_display = uinamespace getvariable ["PO3_respawn_gui",objNull];
_ctrlMAP = _display  displayctrl 860011;
_ctrlERR = _display  displayctrl 860013;
_ctrlERR ctrlSetFade 1;
_ctrlERR ctrlCommit 0.5;

_point = PO3_respawn_positions_list select _select;
_side = _point select 0;
_position = switch (typeName(_point select 1)) do {
	case "STRING" : { if(tolower(_point select 1) != "halo") then { (_point select 1) call PO3_fnc_getPos }else{ (leader group player) call PO3_fnc_getPos } };
	case "OBJECT" : { (_point select 1) call PO3_fnc_getPos };
	default { (_point select 1) call PO3_fnc_getPos };
};

PO3_selected_point = _point;

_ctrlMAP ctrlRemoveAllEventHandlers "MouseButtonDblClick";
_ctrlMAP ctrlMapAnimAdd [1,0.05,_position];
ctrlMapAnimCommit _ctrlMAP;

if( typeName(_point select 1) == "STRING") then {
	if( tolower(_point select 1) == "halo") exitWith {
		if!(isNil "PO3_tempscript_respawnMarker") then {
			terminate PO3_tempscript_respawnMarker;
			PO3_tempscript_respawnMarker = nil;
		};

		_text = localize "STR_PO3_RESPWN_CNTDEPLY5";
		_display = uinamespace getvariable ["PO3_respawn_gui",objNull];
		_ctrlERR = _display  displayctrl 860013;
		_ctrlERR ctrlSetText format["%1",_text ];
		_ctrlERR ctrlSetFade 0;
		_ctrlERR ctrlCommit 0.5;
		_ctrlMAP ctrlAddEventHandler ["MouseButtonDblClick","[player,((_this select 0) ctrlMapScreenToWorld [_this select 2,_this select 3])] spawn PO3_fnc_redeployByHALO;"];
	};
};

_color = _side call PO3_fnc_getUnitMarkerColour;

_fnc_respawnMarker = {
	if(!PO3_a3) exitWith { "selector_selectedMission" };

	private["_return"];
	_return = switch (typeName _this) do {
		case "OBJECT" : {
			switch (true) do {
				case ( _this isKindof "Man" )		: { "respawn_inf" };
				case ( _this isKindof "Car" )		: { "respawn_motor" };
				case ( _this isKindof "Tracked_APC" )	: { "respawn_armor" };
				case ( _this isKindof "Tank" )		: { "respawn_armor" };
				case ( _this isKindof "Helicopter" )	: { "respawn_air" };
				case ( _this isKindof "Plane" )		: { "respawn_plane" };
				case ( _this isKindof "Ship" )		: { "respawn_naval" };
				default { "respawn_unknown" };
			};
		};
		case "LOCATION";
		case "ARRAY";
		case "STRING" : { "respawn_unknown" };
		default { "respawn_unknown" };
	};

	_return
};

deleteMarkerLocal PO3_respawn_selectMarker;
PO3_respawn_selectMarker = createmarkerlocal ["PO3_respawn_selectedMarker", _position ];
PO3_respawn_selectMarker setmarkershapelocal "ICON";
PO3_respawn_selectMarker setmarkertypelocal ( (_point select 1) call _fnc_respawnMarker);
PO3_respawn_selectMarker setmarkercolorlocal _color;
PO3_respawn_selectMarker setmarkertextlocal format[" %1",_text];

if(isNil "PO3_tempscript_respawnMarker" ) then {
	PO3_tempscript_respawnMarker = [] spawn {
		private["_rad"];

		waitUntil {!isNil "PO3_respawn_selectMarker"};
		while {!isNil "PO3_respawn_selectMarker"} do {
			if(isNil "_rad") then { _rad = 0 };
			PO3_respawn_selectMarker setMarkerDirLocal _rad;
			PO3_respawn_selectMarker setMarkerPosLocal ((PO3_selected_point select 1) call PO3_fnc_getPos);
			_rad = _rad + 3;
			sleep 0.02;
		};
	};
};