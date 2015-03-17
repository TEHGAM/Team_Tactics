if(isNil "PO3__VAR_ETCXH_FITCXRE") then { PO3__VAR_ETCXH_FITCXRE = true };
if(isNil "PO3_protector_enable") then { PO3_protector_enable = false };

private["_vehicle "];

_vehicle = _this;

if(typeName _vehicle != typeName objNull) exitWith { ["EventHandler","Fired EH failed to detect Object"] call PO3_fnc_log };

if(!isnil {_vehicle getVariable ["PO3_EH_Fired",nil]}) then {
	_vehicle removeEventHandler ["Fired",_vehicle getVariable ["PO3_EH_Fired",0] ];
}else{
	_vehicle removeAllEventHandlers "Fired";
};

_ehF = _vehicle addEventHandler ["Fired",{
	if(PO3_protector_enable) then {
		_p = _this select 6;
		if(
			_p distance (getMarkerPos "respawn_west") < 500 ||
			_p distance (getMarkerPos "respawn_east") < 500 ||
			_p distance (getMarkerPos "respawn_guerrila") < 500
		)then {
				[player,"HINTC",localize "STR_PO3_DIALOG_CEASEFIRE"] call PO3_fnc_hint;
				deleteVehicle _p;
		}else{
			_p spawn {
				waitUntil {
					if(
						_this distance (getMarkerPos "respawn_west") < 500 ||
						_this distance (getMarkerPos "respawn_east") < 500 ||
						_this distance (getMarkerPos "respawn_guerrila") < 500
					)then {
						[player,"HINTC",localize "STR_PO3_DIALOG_CEASEFIRE"] call PO3_fnc_hint;
						deleteVehicle _this;
					};
					if( isNull _this ) exitWith { true };
					false
				};
			};
		};
	};
}];

_vehicle setVariable ["PO3_EH_Fired",_ehF,false];
