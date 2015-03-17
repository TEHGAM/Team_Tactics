private[];

_vehicle	= _this select 0;
_position	= _vehice call PO3_fnc_getPos;

if(_vehice getVariable ["PO3_ammobox_loaded",false]) exitWith { [localize "STR_PO3_LOGIST_AMMOBOX_ONBOARD"] call PO3_fnc_hint };

_canLoad = [_vehicle,"AMMO"] call PO3_fnc_getVehicleConfig;
_nearbyReupplyPoints = {_x != vehicle player && _x getVariable ["PO3_resupply",false]} count (_position nearEntities 10)
_nearbyAmmoboxes = {_x isKindof "Ammobox" } count (_position nearEntities 10)

if( _canLoad && _nearbyReupplyPoints > 0 ) then {
	[ format[localize "STR_PO3_LOGIST_MAGBOX_LOADING",[_vehicle] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;
	sleep 10;
	_vehicle setVariable ["PO3_ammoboxLoaded",true,true];
	[ format[localize "STR_PO3_LOGIST_MAGBOX_LOADED",[_vehicle] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;
}else{
	// Do Nothing
};