if (!local player) exitWith {};

private ["_crew","_text","_vehicle","_role","_name","_ctrl"];
disableSerialization;
uiNamespace setVariable ["PO3_hud_crewlist", objnull];

if(isnull (uiNamespace getVariable "PO3_hud_crewlist")) then { cutrsc ["PO3_hud_crewlist", "PLAIN"];};
_ctrl = (uiNamespace getVariable 'PO3_hud_crewlist') displayCtrl 860009;

while{isNil "mps_mission_finished"} do{

	_text = "";
	if( PO3_hud_screen_display && !visibleMap && isNil("BIS_DEBUG_CAM") ) then {

		if(vehicle player != player) then {
			_crew = crew (vehicle player);
			_vehicle = vehicle player;
			_name = getText (configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "DisplayName");
			_text = _text + format ["<t>%1</t><br/>", _name];
			{
				if(_x == driver _vehicle || _x == commander _vehicle) then {
					_icon = [typeof vehicle _x] call PO3_fnc_getCfgIcon;
					if(!(format["%1", name _x] == "") and !(format["%1", name _x] == "Error: No unit")) then {
						_distance = round(player distance _x);
						_text = _text + format ["<t>%1</t> <t><img image='%2'></t><br/>", format ["%1 %2 - %3m", toupper localize format ["STR_SHORT_%1",rank _x],toupper name _x,_distance], _icon];
					};
				};
			} forEach _crew;

			_text=_text+"<br/>"
		};

		_text = _text + format["<t size='1.35'>Squad List</t><br/>"];
		{
			_icon = [typeof vehicle _x] call PO3_fnc_getCfgIcon;
			if(!(format["%1", name _x] == "") and !(format["%1", name _x] == "Error: No unit")) then {
				_distance = round(player distance _x);
				_text = _text + format ["<t>%1</t> <t><img image='%2'></t><br/>", format ["%1 %2 - %3m", toupper localize format ["STR_SHORT_%1",rank _x],toupper name _x,_distance], _icon];
			};
		}foreach (units player);
	};

	_ctrl ctrlSetStructuredText parseText _text;
	sleep 0.5;
};

_text = "";
_ctrl ctrlSetStructuredText parseText _text;
