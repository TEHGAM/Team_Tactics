private["_unit","_position","_altitude"];

_unit		= _this select 0;
_position	= [_this select 1,25,round random 360, true] call PO3_fnc_getPos;
_altitude	= [_this, 2, 3000, [3000]] call BIS_fnc_param;

// Begin the Drop
_position set [2,_altitude];
_unit setPos _position;

if(_unit == player) then { true call PO3_fnc_setActionBusy; };

[_unit] spawn PO3_fnc_haloLoadout;
[_unit] spawn PO3_fnc_haloChemlights;
[_unit] spawn PO3_fnc_haloEffects;
[_unit] spawn PO3_fnc_haloAutoOpen;

// FREEFALL
waitUntil {animationState _unit == "HaloFreeFall_non" || (getPos _unit select 2) < 1};
if !(isPlayer _unit) then {
	_unit allowDamage FALSE;
	_unit switchMove "HaloFreeFall_non";
	_unit disableAI "ANIM";
};

// PARACHUTE
waitUntil {animationState _unit == "para_pilot" || (getPos _unit select 2) < 1};
if(animationState _unit == "para_pilot") then {
	sleep 1;
	[vehicle _unit,0,0] call bis_fnc_setpitchbank; // Fix Overspeed Issue forcing spiral
};

// LANDED
waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1};
if !(isPlayer _unit) then {
	_unit enableAI "ANIM";
	_unit setPos [(getPos _unit select 0), (getPos _unit select 1), 0];
	_unit setVelocity [0,0,0];
	_unit setVectorUp [0,0,1];
	sleep 1;
	_unit allowDamage TRUE;
};

if(_unit == player) then { false call PO3_fnc_setActionBusy; };
