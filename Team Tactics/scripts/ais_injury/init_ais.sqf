// by psycho - dont edit!
if (isDedicated && {isPlayer _unit}) exitWith {};				// no player unit controlled on a dedicated server
if (!isDedicated && {!hasInterface}) exitWith {};				// no headless client
_unit = _this select 0;
if (isNil "_unit") exitWith {};
if (!isNil {_unit getVariable "tcb_ais_aisInit"}) exitWith {};	// prevent that a unit run the init twice
_unit setVariable ["tcb_ais_aisInit",true];
#include "ais_setup.sqf"

"tcb_ais_in_agony" addPublicVariableEventHandler {
	_unit = (_this select 1) select 0;
	_in_agony = (_this select 1) select 1;
	_side = _unit getVariable "tcb_ais_side";
	if (playerSide == _side) then {
		if (_in_agony) then {
			_unit playActionNow "agonyStart";
			[side _unit,"HQ"] sideChat format ["%1 is down and needs help at %2",name _unit, mapGridPosition _unit];
			_fa_action = _unit addAction [format["<t color='#F00000'>First Aid to %1</t>",name _unit],{_this spawn tcb_fnc_firstAid},_unit,100,false,true,"",
				"{not isNull (_target getVariable _x)} count ['healer','dragger'] == 0 && {alive _target} && {vehicle _target == _target}
			"];
			_drag_action = _unit addAction [format["<t color='#FC9512'>Drag %1</t>",name _unit],{_this spawn tcb_fnc_drag},_unit,99,false,true,"",
				"{not isNull (_target getVariable _x)} count ['healer','dragger'] == 0 && {alive _target} && {vehicle _target == _target}
			"];
			_unit setVariable ["fa_action", _fa_action];
			_unit setVariable ["drag_action", _drag_action];
			[_unit] execFSM (TCB_AIS_PATH+"fsm\ais_marker.fsm");
		} else {
			_unit playActionNow "agonyStop";
			_unit removeAction (_unit getVariable "fa_action");
			_unit removeAction (_unit getVariable "drag_action");
			_unit setVariable ["fa_action", nil];
			_unit setVariable ["drag_action", nil];
		};
	};
};

tcb_healerStopped = false;
_unit setVariable ["unit_is_unconscious", false];
_unit setVariable ["tcb_ais_headhit", 0];
_unit setVariable ["tcb_ais_handshit", 0];
_unit setVariable ["tcb_ais_bodyhit", 0];
_unit setVariable ["tcb_ais_legshit", 0];
_unit setVariable ["tcb_ais_overall", 0];
_unit setVariable ["tcb_ais_unit_died", false];
_unit setVariable ["tcb_ais_leader", false];
_unit setVariable ["tcb_ais_fall_in_agony_time_delay", 999999];

if (tcb_ais_show_3d_icons == 1) then {
	_icons = addMissionEventHandler ["Draw3D", {
		{
			if ((_x distance player) < 30 && {_x getVariable "tcb_ais_agony"}) then {
				drawIcon3D ["a3\ui_f\data\map\MapControl\hospital_ca.paa", [0.6,0.15,0,0.8], _x, 0.5, 0.5, 0, format["%1 (%2m)", name _x, ceil (player distance _x)], 0, 0.02];
			};
		} forEach playableUnits;
	}];
};

_timeend = time + 2;
waitUntil {!isNil {_unit getVariable "BIS_fnc_feedback_hitArrayHandler"} || {time > _timeend}};	// work around to ensure this EH is the last one that was added
["%1 --- adding wounding handleDamage eventhandler first time",diag_ticktime] call BIS_fnc_logFormat;
_unit addEventHandler ["HandleDamage", {_this call tcb_fnc_handleDamage}];

[_unit] execFSM (TCB_AIS_PATH+"fsm\ais.fsm");

if (isPlayer _unit) then {
	waitUntil {sleep 0.3; !isNull (findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call tcb_fnc_keyUnbind"];
};
