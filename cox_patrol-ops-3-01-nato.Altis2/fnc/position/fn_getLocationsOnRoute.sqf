/*
	PO3 function - PO3_fnc_getRelLocations

	Used to retrieve locations between point 1 and point 2


	Written By: Dash

	Params:
	0 - <"marker" / object / [x,y,z] position> of starting location
	1 - <"marker" / object / [x,y,z] position> of target location
	2 - OPTIONAL - angle on which to search for (default: 60)
	3 - OPTIONAL - [ARRAY] of location types as defined by cfgLocations. (default: ["Airport","CityCenter","Hill","NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"])
	4 - OPTIONAL - Number - distance past target to search for locations
	_routeLocs = ["return_point",_position,55] call PO3_fnc_getRelLocations;
*/

private["_startLoc","_targetLoc","_allowedAngle","_locTypes","_distancePast"];

_startLoc	= (_this select 0) call PO3_fnc_getPos;
_targetLoc	= (_this select 1) call PO3_fnc_getPos;
_allowedAngle	= if(count _this > 2) then { _this select 2 }else{ 50 };
_locTypes	= if(count _this > 3) then { _this select 3 }else{ ["Airport","CityCenter","Hill","NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"] };
_distancePast	= if(count _this > 4) then { _this select 4 }else{ 750 };

if( typeName _locTypes == typeName "" ) then { _locTypes = [_locTypes] };

_dist	= _startLoc distance _targetLoc;
_locs	= nearestLocations [_startLoc,_locTypes,(_dist + _distancePast)]; //Get all locations around start loc within a certain range
_dirTo	= [_startLoc, _targetLoc ] call BIS_fnc_dirTo;

_possibleLocs = [];
{
	_inLine = [_startLoc,_dirTo,_allowedAngle,locationPosition _x] call BIS_fnc_inAngleSector;
	if(_inLine && (_x distance _startLoc > 2000)) then {
		_possibleLocs = _possibleLocs + [locationPosition _x];
	};
} forEach _locs;

if(PO3_debug) then {
	{
		if(_x distance _startLoc > 1500) then {
			_marker = createMarkerlocal [format["PO3_temp_ap%1",_x],_x];
			_marker setMarkerTypelocal "mil_flag";
			_marker setMarkersizelocal [0.5,0.5];
		};
	} forEach _possibleLocs;
};

_possibleLocs