/*
	Author: Eightysix

	Description:
		Inspired by Meatballs weather cycle but re-written and MP compatible

	Syntax:

*/
if !(isServer) exitWith {};
waitUntil {
	sleep 600;

// Overcast
	_randOvercast = (round((random(0.3)-0.15)*100))/100;
	_forecastOvercast = (((PO3_pVAR_weatherCycle select 0) + _randOvercast) min 1) max 0;
	if (_forecastOvercast > 1) then {_forecastOvercast = _forecastOvercast - (2*_randOvercast)};
	if (_forecastOvercast < 0) then {_forecastOvercast = _forecastOvercast + (abs(2*_randOvercast))};
	PO3_pVAR_weatherCycle set [2,_forecastOvercast];

// Rain
	_forecastRain = if( (PO3_pVAR_weatherCycle select 2) > 0.7) then { random (PO3_pVAR_weatherCycle select 2) }else{ 0 };
	PO3_pVAR_weatherCycle set [0,_forecastRain];

// Fog Daily Cycle (Sine Curve)
	_hour = if(_forecastRain > 0) then { 0 }else{ date select 3 };
	_fogV = (sin( _hour/2.443 ) * 0.6) max 0;	// Value
	_fogD = (sin( _hour/2.443 ) * 0.2) max 0;	// Decay/Falloff
	_fogB = (sin( _hour/2.443 ) * 11 ) max 0;	// Base
	PO3_pVAR_weatherCycle set [1, [_fogV,_fogD,_fogB] ];

// East Wind
	_forecastWindE = random (_forecastOvercast);
	PO3_pVAR_weatherCycle set [3,_forecastWindE];
// North Wind
	_forecastWindN = random (_forecastOvercast);
	PO3_pVAR_weatherCycle set [4,_forecastWindN];


// Configure weather settings on server to match next 10 minute weather forecast.
	publicVariable "PO3_pVAR_weatherCycle";
	["Weather",format["Weather Cycle change at %1 to %2",date,PO3_pVAR_weatherCycle ],true] call PO3_fnc_log;

	[PO3_pVAR_weatherCycle select 0, 60] call PO3_fnc_setRain;
	[PO3_pVAR_weatherCycle select 1, 60] call PO3_fnc_setFog;
	[PO3_pVAR_weatherCycle select 2, 60] call PO3_fnc_setOvercast;
	[PO3_pVAR_weatherCycle select 3,PO3_pVAR_weatherCycle select 4] spawn PO3_fnc_setWind;

	false;
};