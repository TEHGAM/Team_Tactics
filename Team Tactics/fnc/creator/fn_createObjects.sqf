if(!PO3SRV) exitWith {};

/* COMMAND REDUNDANT
_hc = call PO3_HLC_get;
if( typeName _hc == "ARRAY" ) then {
	PO3_HLC_pubVar_spawn_ary = [_hc,_this,random 999];
	(_hc select 0) publicVariableClient "PO3_HLC_pubVar_spawn_ary";

	["Object ObjectSpawner",format["Server Detected HLC, Sending %1 to HLC for creation",_this] ] call PO3_fnc_log;

	waitUntil { !isNil "PO3_SRV_HLC_grp_recieved" };

	_return = PO3_SRV_HLC_grp_recieved;
	PO3_SRV_HLC_grp_recieved = nil;

	["Object ObjectSpawner",format["Server Detected HLC has created %1",_return] ] call PO3_fnc_log;

	_return;
}else{*/
	// MOVED OUT OF IF STATEMENT TO BELOW
/*};*/

_return = _this call PO3_fnc_objectsSpawner;
_return;
