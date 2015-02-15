private["_unit","_heliNear"];

_unit = _this select 0;
if !(_unit == player) exitWith {};
/*
_heliNear = nearestObjects [_unit, ["helicopter"], 50];
if (count _heliNear == 0) then { playSound "C130_exit" };
*/

// FREEFALL
waitUntil {animationState _unit == "HaloFreeFall_non" || (getPos _unit select 2) < 1};
if !(animationState _unit == "HaloFreeFall_non") exitWith {};
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 5;
[_unit] spawn {
	while { animationState (_this select 0) == "HaloFreeFall_non" || (getPos (_this select 0) select 2) > 1} do {
		playSound "BIS_HALO_Flapping";
		sleep 4.2;
	};
};

// PARACHUTE
waitUntil {animationState _unit == "para_pilot" || (getPos _unit select 2) < 1};
if !(animationState _unit == "para_pilot") exitWith {};
playSound "BIS_Steerable_Parachute_Opening"; //play chute opening sound
setAperture 0.05;
setAperture -1;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust [8.0];
"DynamicBlur" ppEffectCommit 0.01;
sleep 1;
"DynamicBlur" ppEffectAdjust [0.0];
"DynamicBlur" ppEffectCommit 3;
sleep 3;
"DynamicBlur" ppEffectEnable false;
"RadialBlur" ppEffectAdjust [0.0, 0.0, 0.0, 0.0];
"RadialBlur" ppEffectCommit 1.0;
"RadialBlur" ppEffectEnable false;
[_unit] spawn {
	while { animationState (_this select 0) == "para_pilot" || (getPos (_this select 0) select 2) > 2} do {
		playSound "BIS_HALO_Flapping";
		sleep 4.2;
	};
};

// LANDED
waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1};
playSound "BIS_Steerable_Parachute_Opening";