/*
	Author: Jiri Wainar Modified by Eightysix

	Description:
	Display OSD with location, time and possibly some other campaign related info.

	Parameter(s):
	_this select 0: array (optional)	- position (default: player's position)
	_this select 1: array (optional)	- date in format [_year,_month,_day,_hour,_min] (default: current date)

	Example:
	[] call PO3_fnc_showTacticalText;

	Returns:
	- nothing -
*/

private["_fn_getSector","_position","_date","_output","_showDate","_showLocation","_showMap","_tLoc","_tMap","_tDate","_tTime","_tTimeH","_tTimeM","_tDay","_tMonth","_tYear"];

_position  	= [_this, 0, getPos player, [[]]] call BIS_fnc_param;
_date 	   	= [_this, 1, date, [[]]] call BIS_fnc_param;
_tMap		= [_this, 2, "auto", [""]] call BIS_fnc_param;
_tLoc		= [_this, 3, "auto", [""]] call BIS_fnc_param;

_fn_getSector = {
	private["_map","_posX","_posY","_gridX","_gridY","_secWidth","_secHeight"];
	private["_bottomLeftX","_bottomLeftY","_topRightX","_topRightY"];

	_map = toLower worldName;

	if !(_map in ["altis","stratis"]) exitWith { -1 };
	if (_map == "stratis") then {
		_bottomLeftX = 1302;
		_bottomLeftY = 230;
		_topRightX   = 6825;
		_topRightY   = 7810;
	}else{
		_bottomLeftX = 1765;
		_bottomLeftY = 4639;
		_topRightX   = 28624;
		_topRightY   = 26008;
	};

	_posX = _this select 0;
	_posY = _this select 1;

	if !(_posX > _bottomLeftX && _posX < _topRightX && _posY > _bottomLeftY && _posY < _topRightY) exitWith { 0 };
	_posX      = _posX - _bottomLeftX;
	_posY      = _posY - _bottomLeftY;
	_secWidth  = (_topRightX - _bottomLeftX)/3;
	_secHeight = (_topRightY - _bottomLeftY)/3;
	_gridX = floor (_posX/_secWidth);
	_gridY = floor (_posY/_secHeight);

	((_gridY * 3) + _gridX + 1)
};

_showDate	= true;
_showMap	= if (_tMap != "") then { true }else{ false };
_showLocation	= if (_tLoc != "") then { true }else{ false };

if (_showMap && _tMap == "auto") then {
	private["_sector","_map","_template"];

	_sector = _position call _fn_getSector;
	if (_sector == -1) then {
		_showMap 	= false;
		_showLocation 	= false;
	};

	_map = gettext (configfile >> "cfgworlds" >> worldname >> "description");

	_template = switch (_sector) do {
		case 1: {localize "STR_A3_SectorNorthWest"};
		case 2: {localize "STR_A3_SectorSouth"};
		case 3: {localize "STR_A3_SectorSouthEast"};
		case 4: {localize "STR_A3_SectorWest"};
		case 5: {localize "STR_A3_SectorCentral"};
		case 6: {localize "STR_A3_SectorEast"};
		case 7: {localize "STR_A3_SectorNorthWest"};
		case 8: {localize "STR_A3_SectorNorth"};
		case 9: {localize "STR_A3_SectorNorthEast"};
		default {
			_showLocation = false;
			switch (toLower worldname) do {
				case "stratis" : { localize "STR_A3_NearStratis" };
				default { localize "STR_A3_NearAltis" };
			};
		};
	};

	_tMap = format[_template,_map];
};

if (_showLocation && _tLoc == "auto") then {
	private["_locations","_loc"];

	_locations = nearestLocations [getPos player, ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 500];
	{ if (text _x == "") then { locations set [_forEachIndex, objNull] }; }forEach _locations;
	_locations = _locations - [objNull];

	_tLoc = "";
	if (count _locations > 0) then {
		_loc = _locations select 0;

		_tLoc = if ((getPos player) in _loc) then {
			text _loc;
		}else{
			format[localize "STR_A3_NearLocation", text _loc];
		};
	}else{
		_showLocation = false;
	};
};

_tYear 	= _date select 0;
_tMonth = _date select 1;
_tDay 	= _date select 2;
_tTimeH = _date select 3;
_tTimeM = _date select 4;

if (_tMonth < 10) then {_tMonth = format["0%1",_tMonth]};
if (_tDay < 10) then {_tDay = format["0%1",_tDay]};
_tDate = format["%1-%2-%3",_tYear,_tMonth,_tDay];

if (_tTimeH < 10) then {_tTimeH = format["0%1",_tTimeH]};
if (_tTimeM < 10) then {_tTimeM = format["0%1",_tTimeM]};
_tTime = format["%1:%2",_tTimeH,_tTimeM];

_output = [ [_tDate,"<t size='1.0' font='PuristaMedium'>%1</t>",0], [_tTime,"<t size='1.0' font='PuristaBold'>%1</t><br/>",5] ];

if (_showLocation) then {
	_output = _output + [[toUpper _tLoc,"<t size='0.9' font='PuristaBold'>%1</t><br/>",5]];
};

if (_showMap) then {
	_output = _output + [[_tMap,"<t size='0.9'>%1</t><br/>",30]];
};

[_output,-safezoneX,0.85,"<t color='#FFFFFFFF' align='right'>%1</t>"] spawn BIS_fnc_typeText;