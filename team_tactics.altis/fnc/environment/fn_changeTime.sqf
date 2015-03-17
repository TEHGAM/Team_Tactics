/*
	Author: Eightysix

	Description:
	Returns Marker Type of the type vehicle the unit or group is operating.

	Syntax:
	_Type = (unit/group/vehicle) call PO3_fnc_getObjectMarkerType;

	Example:
	_Type = (player) call PO3_fnc_getObjectMarkerType;
	_Type = (vehicle player) call PO3_fnc_getObjectMarkerType;
*/
private["_year","_month","_day","_hour","_min"];

_year	= if(count _this > 3) then { _this select 0 }else{ date select 0 };
_month	= if(count _this > 3) then { _this select 1 }else{ date select 1 };
_day	= if(count _this > 3) then { _this select 2 }else{ date select 2 };
_hour	= if(count _this > 3) then { _this select 3 }else{ _this select 0 };
_min	= if(count _this > 3) then { _this select 4 }else{ _this select 1 };
_text	= if(count _this > 3) then {
	if(count _this > 5) then { _this select 5 }else{ "" };
}else{
	if(count _this > 2) then { _this select 2 }else{ "" };
};

if(isServer && isMultiplayer) exitWith {
	setDate [_year,_month,_day,_hour,_min];
	["PO3_fnc_changeTime",format["setDate %1",[_year,_month,_day,_hour,_min] ],true] call PO3_fnc_log;
};

if(!isDedicated) then {
	[3,format["%1",_text]] call PO3_fnc_camera_fadeout;

	setDate [_year,_month,_day,_hour,_min];

	if(date select 3 < 10) then { _hour = format["0%1",date select 3]; }else{_hour = str(date select 3);} ;
	if(date select 4 < 10) then { _min  = format["0%1",date select 4]; }else{_min  = str(date select 4);} ;
	[
		"SITREP: " + localize "STR_MISSION_NAME"
		+ "||Date: " +str(date select 0) + "-"+ str(date select 1) + "-"+ str(date select 2)
		+ "|Time: " + _hour + _min + " HOURS"
		+ "|Weather: " + str round(overcast*100) + "%"
		+ "|Fog: " + str round(fog*100) + "%"
		+ "||" + format["%1",_text]
	] spawn PO3_fnc_text_sitrep;

//	sleep 8;
	[3,""] call PO3_fnc_camera_fadein;
};

true;