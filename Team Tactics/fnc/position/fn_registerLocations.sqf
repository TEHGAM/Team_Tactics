private["_worldradius","_all","_locations","_locBSE","_locCTY","_locHIL","_locPOI","_locTWN","_locWTR"];

{
	_position = _x call PO3_fnc_getPos;
	if(_position distance [0,0,0] > 10) then {
		_location = createLocation ["NameLocal", _position, 200, 200];
		_location setText "Military Post";
		_location setName "Military Post";
	};
}forEach [
	 "PO3_loc_military_1","PO3_loc_military_2","PO3_loc_military_3","PO3_loc_military_4","PO3_loc_military_5"
	,"PO3_loc_military_6","PO3_loc_military_7","PO3_loc_military_8","PO3_loc_military_9","PO3_loc_military_10"
	,"PO3_loc_military_11","PO3_loc_military_12","PO3_loc_military_13","PO3_loc_military_14"
];

{
	_position = _x call PO3_fnc_getPos;
	if(_position distance [0,0,0] > 10) then {
		_location = createLocation ["NameLocal", _position, 100, 100];
		_location setText "Resupply Base";
		_location setName "Resupply Base";
	};
}forEach ["PO3_loc_resupplybase_1","PO3_loc_resupplybase_2","PO3_loc_resupplybase_3","PO3_loc_resupplybase_4"];

{
	_position = _x call PO3_fnc_getPos;
	if(_position distance [0,0,0] > 10) then {
		_location = createLocation ["Airport", _position, 300, 300];
		_location setText "Airfield";
		_location setName "Airfield";
	};
}forEach ["PO3_loc_airport_1","PO3_loc_airport_2","PO3_loc_airport_3","PO3_loc_airport_4","PO3_loc_airport_5"];

_worldradius = 1500*Log(PO3_worldsize/1000);
_all = nearestLocations [[0,0],["Airport","CityCenter","Hill","NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"],100000];

_locations = [];
_locAIR = [];
_locBSE = [];
_locCTY = [];
_locHIL = [];
_locPOI = [];
_locTWN = [];
_locWTR = [];
_locOTH = [];
_locRSP = [];

PO3_gvar_locations = [];
{
	if(	position _x distance getMarkerPos "respawn_west" > _worldradius &&
		position _x distance getMarkerPos "respawn_east" > _worldradius &&
		!(toLower(text _x) IN ["sagonisi","katalaki bay","melanera bay","pefkas bay","tonos bay"])
	) then {
		_text = switch (toLower (type _x)) do {
			case "airport"			: { _locAIR set [count _locAIR,[_x,"ColorOrange"]]; "Airport" };
			case "citycenter";
			case "namecitycaptial"	: { _locCTY set [count _locCTY,[_x,"ColorOrange"]]; "City" };
			case "namecity";
			case "namevillage"		: { _locTWN set [count _locTWN, [_x,"ColorWhite"]]; "Town" };
			case "namemarine"		: { _locWTR set [count _locWTR, [_x,"ColorBlue" ]]; "Bay" };
			case "hill"				: { _locHIL set [count _locHIL, [_x,"ColorGreen"]]; "Hill" };
			case "namelocal"		: {
				switch ( toLower(text _x) ) do {
					case "castle"			: { _locPOI set [count _locPOI,[_x,"ColorIndependent"]]; "POI" };
					case "factory"			: { _locPOI set [count _locPOI,[_x,"ColorIndependent"]]; "Factory" };
					case "storage"			: { _locPOI set [count _locPOI,[_x,"ColorIndependent"]]; "Factory" };
					case "mine"				: { _locPOI set [count _locPOI,[_x,"ColorIndependent"]]; "Mine" };
					case "quarry"			: { _locPOI set [count _locPOI,[_x,"ColorIndependent"]]; "Mine" };
					case "stadium"			: { _locPOI set [count _locPOI,[_x,"ColorIndependent"]]; "Stadium" };
					case "power plant"		: { _locPOI set [count _locPOI,[_x,"ColorIndependent"]]; "Power" };
					case "military post"	: { _locBSE set [count _locBSE,[_x,"ColorOPFOR"]]; "Military" };
					case "resupply base"	: { _locRSP set [count _locRSP,[_x,"ColorRed"]]; "Resupply" };
					default { _locOTH set [count _locOTH,[_x,"ColorBlack"]]; "Other" };
				};
			};
			default { _locOTH set [count _locOTH,[_x,"ColorBlack"]]; "Other" };
		};
		PO3_gvar_locations set [count PO3_gvar_locations,[_text,_x,_x call PO3_fnc_getPos]];
	};
} foreach _all;

if(PO3_debug) then {
	{
		_marker = createMarkerlocal [format["PO3_LOC_%1",_x select 0],position (_x select 0)];
		_marker setMarkerShapelocal "ICON";
		_marker setMarkerTypelocal "mil_dot";
		_marker setMarkerColorlocal (_x select 1);
		_marker setMarkerSizeLocal [0.5,0.5];
		_marker setMarkerAlpha 0.3;
	} foreach (_locPOI+_locTWN+_locCTY+_locBSE+_locHIL+_locWTR+_locRSP);
};

PO3_pos_allowed = [_locBSE,_locCTY,_locHIL,_locTWN,_locWTR,_locPOI,_locAIR,_locOTH,_locRSP];
["PO3_fnc_registerLocations",format["Locations Registered: %1",PO3_pos_allowed]] call PO3_fnc_log;
["PO3_fnc_registerLocations",format["Locations Registered: %1",PO3_gvar_locations]] call PO3_fnc_log;

PO3_pos_allowed;