PO3_sVAR_HLCKeepAlive = [objNull,0,time];
if(isServer || hasInterface) exitWith {
	["HLC",format["Exit fnc_sendKeepalive %1 || %2",isServer,hasInterface]] spawn PO3_fnc_log;
	if(isServer) then {
		"PO3_sVAR_HLCKeepAlive" addPublicVariableEventHandler { (_this select 1) call PO3_fnc_hlc_assignOwner };
	};
};

["HLC","Beginning send KeepAlive"] spawn PO3_fnc_log;
waitUntil {
	waitUntil { !(isNull player) };
	waitUntil { alive player };

	PO3_sVAR_HLCKeepAlive = [player,diag_fps,time];
	publicVariableServer "PO3_sVAR_HLCKeepAlive";
	["HLC",format["%1 sent %2 keepAlive to Server",player,PO3_sVAR_HLCKeepAlive]] spawn PO3_fnc_log;

	sleep 15;
	false;
};