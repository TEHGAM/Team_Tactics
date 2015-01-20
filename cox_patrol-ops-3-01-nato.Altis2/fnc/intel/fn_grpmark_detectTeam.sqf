(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", {
	{
		if(_x != Leader group _x) then {
			_icon = _x call PO3_fnc_getObjectMarkerType;
			_name = if( !(format["%1", name _x] == "") and !(format["%1", name _x] == "Error: No unit") ) then { format ["%1 %2", toupper localize format ["STR_SHORT_%1",rank _x],toupper (name _x)] }else{"Unit KIA"};
			[
				(_this select 0),
				getText (configFile >> "CfgMarkers" >> _icon >> "Icon"),
				_x call PO3_fnc_hud_getTeamColour,
				getPos _x,
				0.05/ctrlMapScale (_this select 0),
				0.05/ctrlMapScale (_this select 0),
				0,
				if(ctrlMapScale(_this select 0) < 0.0025) then {_name}else{""},
				0,
				0.00005/ctrlMapScale (_this select 0)
			] call  PO3_fnc_drawIcon;
		};
	}forEach (units group player);
}];