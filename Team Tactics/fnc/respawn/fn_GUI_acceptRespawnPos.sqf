/*
	Author: Eightysix

	Description:

*/
if( isNil "PO3_selected_point") exitWith {
	_text = localize "STR_PO3_RESPWN_CANTDEPLY";
	_display = uinamespace getvariable ["PO3_respawn_gui",objNull];
	_ctrlERR = _display  displayctrl 860013;
	_ctrlERR ctrlSetText format["%1",_text ];
	_ctrlERR ctrlSetFade 0;
	_ctrlERR ctrlCommit 0.5;
};

private["_point","_side","_position"];

_point = PO3_selected_point;
_side = _point select 0;
_dest = _point select 1;

_respawned = false;
_text = "";

switch (typeName _dest) do {
	case "OBJECT" : {
		_displayname = [_dest] call PO3_fnc_getCfgText;

		switch(true) do {
			case ( _dest isKindOf "AIR" ) : {
				if( (getPos _dest) select 2 > 50 ) then {
					if ( (_dest emptyPositions "cargo") > 0) then {
						player moveInCargo _dest;
						_respawned = true;
					}else{
						_text = format[localize "STR_PO3_RESPWN_CNTDEPLY1", toUpper _displayname];
					};
				}else{
					_text = format[localize "STR_PO3_RESPWN_CNTDEPLY2", toUpper _displayname];
				};

			};
			case ( _dest isKindOf "LANDVEHICLE" ) : {
				if( speed _dest < 1 ) then {
					if ( (_dest emptyPositions "cargo") > 0) then {
						player moveInCargo _dest;
						_respawned = true;
					}else{
						player setPosATL ( [[_dest,(5 + random 5),random 360,false],10] call PO3_fnc_getflatarea );
						_respawned = true;
					};
				}else{
					_text = format[localize "STR_PO3_RESPWN_CNTDEPLY3", toUpper _displayname];
				};
			};
			case ( _dest isKindOf "SHIP" ) : {
				if( speed _dest < 1 ) then {
					if ( (_dest emptyPositions "cargo") > 0) then {
						player moveInCargo _dest;
						_respawned = true;
					}else{
						_text = format[localize "STR_PO3_RESPWN_CNTDEPLY1", toUpper _displayname];
					};
				}else{
					_text = format[localize "STR_PO3_RESPWN_CNTDEPLY3", toUpper _displayname];
				};

			};
			default {
				player setPosATL ( [[_dest,(1),random 360,false],10] call PO3_fnc_getflatarea );
				_respawned = true;
			};
		};
	};
	case "STRING" : {
		if( toLower(_dest) == "halo" ) then {
			if(PO3_param_respawn_halo_allow) then {
				if(time >= PO3_respawn_halo_nextAvailable) then {
					_text = localize "STR_PO3_RESPWN_CNTDEPLY5";
				}else{
					_text = localize "STR_PO3_RESPWN_CNTDEPLY7";
				};
			}else{
				_text = localize "STR_PO3_RESPWN_CNTDEPLY6";
			};

		}else{
			player setPosATL ( [[_dest,(1 + random 5),random 360,false],10] call PO3_fnc_getflatarea );
			_respawned = true;
		};
	};
	default {
		player setPosATL ( [[_dest,(random 2),random 360,false],10] call PO3_fnc_getflatarea );
		_respawned = true;
	};
};

if(!_respawned) exitWith {
	_display = uinamespace getvariable ["PO3_respawn_gui",objNull];
	_ctrlERR = _display  displayctrl 860013;
	_ctrlERR ctrlSetText format["%1",_text ];
	_ctrlERR ctrlSetFade 0;
	_ctrlERR ctrlCommit 0.5;
};

PO3_player_respawned = true;
PO3_selected_point = nil;
deleteMarkerLocal PO3_respawn_selectMarker;

if( !isNil "PO3_tempscript_respawnMarker" ) then {
	terminate PO3_tempscript_respawnMarker;
	PO3_tempscript_respawnMarker = nil;
};