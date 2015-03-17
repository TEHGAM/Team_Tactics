/*
	Author: Eightysix

	Description:
	Returns Marker Type of the type vehicle the unit or group is operating.

	Syntax:
	_Type = (unit/group/vehicle) call PO3_fnc_getObjectMarkerType;

*/

if(PO3_param_ambient_weather_enable) then {
	if(PO3SRV) then {
		PO3_pVAR_weatherCycle = [
			0,		// 1 Rain
			0,		// 2 Fog
			0.49,	// 0 Wind
			0.1,	// 3 Wind N
			0.1		// 4 Wind E
			];	publicVariable "PO3_pVAR_weatherCycle";
	};

	if(PO3CLI) then {
		waitUntil {!isnil "PO3_pVAR_weatherCycle"};
		"PO3_pVAR_weatherCycle" addPublicVariableEventHandler	{
			(_this select 1) spawn {
				[_this select 0,60] call PO3_fnc_setRain;
				[_this select 1,60] call PO3_fnc_setFog;
				[_this select 2,60] call PO3_fnc_setOvercast;
				[_this select 3,_this select 4] call PO3_fnc_setWind;
			};
		};
	};

	skiptime -24;
	[PO3_pVAR_weatherCycle select 0,86400] call PO3_fnc_setRain;
	[PO3_pVAR_weatherCycle select 1,86400] call PO3_fnc_setFog;
	[PO3_pVAR_weatherCycle select 2,86400] call PO3_fnc_setOvercast;
	skipTime 24;
	simulweatherSync;
	[PO3_pVAR_weatherCycle select 3,PO3_pVAR_weatherCycle select 4] call PO3_fnc_setWind;
	[] spawn PO3_fnc_weatherCycle;
};

if(PO3CLI) then {
	[] spawn {
		waitUntil{ time > 0 };
		date call PO3_fnc_setTime;
	};
};