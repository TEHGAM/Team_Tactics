PO3_logistics_SelectedLoadObject = _this select 0;

[true,"HINT",format[ localize "STR_PO3_LOGIST_SELETLOADER",[PO3_logistics_SelectedLoadObject] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;

PO3_logistics_SelectedLoadObject spawn {
	_timeStamp = time + 15;
	waitUntil{ _timeStamp < time };
	if !(isNil "PO3_logistics_SelectedLoadObject") then {
		if(_this == PO3_logistics_SelectedLoadObject) then {
			PO3_logistics_SelectedLoadObject = nil;
			[true,"HINT","Canceled Load of Object"] call PO3_fnc_hint;
		};

	};
};