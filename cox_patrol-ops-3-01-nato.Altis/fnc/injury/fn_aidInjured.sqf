private["_unitInAgony","_firstAider","_offset","_relpos","_time","_damage","_healed"];

_unitInAgony = _this select 0;
_firstAider = _this select 1;

if!([_unitInAgony] call PO3_fnc_injuredIsHealable) exitWith { [true,"HINT",format["%1 is unable to be healed",name _unitInAgony]] call PO3_fnc_hint };
if(_firstAider distance _unitInAgony > 4) exitWith{ [true,"HINT",format["%1 is too far away to be healed",name _unitInAgony]] call PO3_fnc_hint };

if(_firstAider == player) then {
	if( player call PO3_fnc_checkActionBusy ) exitWith {};
	true call PO3_fnc_setActionBusy;
	PO3_VAR_HealingStatus = true; //<!-- HACK JOB
};

_time = time;

// Get the damage of the injured unit
_damage = (((_unitInAgony getVariable ["PO3_injury_healedDamage",0]) max 1) min 1.5) * 10; // A MIN of 10secs and MAX of 15secs
_targetTime = _time + _damage;

// Set the variables on the injured unit to state they are being healed
_unitInAgony setVariable ["PO3_injury_BeingHealed",true,true];
_unitInAgony setVariable ["PO3_injury_healer",_firstAider,true];

// Move the healer to the side of the injured and begin healing
/*
_offset = [0,0,0]; _dir = 0;
_relpos = _unitInAgony worldToModel position _firstAider;
if( (_relpos select 0) < 0 ) then{
	_offset = [-0.8,0.2,0];
	_dir = 90 + (direction _unitInAgony);
}else{
	_offset = [0.8,0.2,0];
	_dir = 270 + (direction _unitInAgony);
};

_healPos = ([_unitInAgony,0.8,(_dir-180)] call PO3_fnc_getPos); _healPos set [2,(getPosATL _unitInAgony) select 2];
*/
[_firstAider,"Healer_Start"] call PO3_fnc_animateUnit;
/*
_firstAider setPosATL _healPos;
_unitInAgony attachTo [_firstAider,_offset];
_unitInAgony setDir _dir;
*/

// healer is not playing the required animation
PO3_VAR_animCheck = true;
[_targetTime] spawn {
	_targetTime = _this select 0;
	sleep 2.5;
	waitUntil {sleep 1; (!((animationState player == "ainvpknlmstpsnonwrfldnon_medic0s") || (animationState player == "ainvpknlmstpsnonwrfldnon_medic") || (animationState player == "ainvpknlmstpsnonwrfldnon_medicup") || (animationState player == "ainvpknlmstpsnonwrfldnon_medicup0s") || (animationState player == "amovpknlmstpslowwrfldnon_amovpknlmstpsraswrfldnon")) || (_targetTime <= time))};
	if (_targetTime > time) exitWith {PO3_VAR_HealingStatus = false; PO3_VAR_animCheck = false};
};

While{
	time < _targetTime
	// the healer is alive
	&& alive _firstAider
	// the injured is alive
	&& alive _unitInAgony
	// the healer is neaby the injured
	&& (_firstAider distance _unitInAgony) < 2.5
	// The healer hasn't been shot
	&& !(_firstAider getVariable ["PO3_injury_inAgony",false])
	// HACK JOB
	&& (PO3_VAR_HealingStatus)
	// healer is playing the required animation
	&& (PO3_VAR_animCheck)
}do{
	[ [_firstAider,_unitInAgony],["Applying First Aid",((time - _time) / (_damage)) min 1]] call PO3_fnc_progressBar;
	sleep 1;
};

sleep 0.5;
if(_targetTime <= time) then
{
	[ [_firstAider,_unitInAgony],["Applying First Aid",((time - _time) / (_damage)) min 1]] call PO3_fnc_progressBar;
};

//detach _unitInAgony;
_unitInAgony setVariable ["PO3_injury_BeingHealed",false,true];

// If the healer is in agony
if( _firstAider getVariable ["PO3_injury_inAgony",false] ) exitWith { _unitInAgony setVariable ["PO3_injury_healer",objNull,true] };
// Healer is not in agony so make them not busy
if(_firstAider == player) then { false call PO3_fnc_setActionBusy; };
// If the healer moved too far away
if( _firstAider distance _unitInAgony >= 2.5 ) exitWith { _unitInAgony setVariable ["PO3_injury_healer",objNull,true] };
// If the injured died
if !(alive _unitInAgony) exitWith { [true, "HINT", format["%1 has Died",name _unitInAgony] ] call PO3_fnc_hint };
// If the healer died
if !(alive _firstAider) exitWith {};
// Finish healing Animation
[_firstAider,"Healer_Done"] call PO3_fnc_animateUnit;
// If they are still in the "healing state" then heal the injured
if(_targetTime <= time) then {
	_isMedic = _firstAider call PO3_fnc_isMedic;
	_healed = switch (true) do {
		case ( (_isMedic) && (_firstAider call PO3_fnc_hasMedKit) ) : { 0 };
		//take ifak from injured person first
		case ( (_isMedic) && (_firstAider call PO3_fnc_hasFirstAidKit) ) : { _unitInAgony spawn PO3_fnc_useFirstAidKit; 0.025 };
		case ( !(_isMedic) && (_firstAider call PO3_fnc_hasFirstAidKit) ) : { _unitInAgony spawn PO3_fnc_useFirstAidKit; 0.05 };
		//if injured does not have ifak then use healers ifak
		case ( (_isMedic) && (_firstAider call PO3_fnc_hasFirstAidKit) ) : { _firstAider spawn PO3_fnc_useFirstAidKit; 0.025 };
		case ( !(_isMedic) && (_firstAider call PO3_fnc_hasFirstAidKit) ) : { _firstAider spawn PO3_fnc_useFirstAidKit; 0.05 };
		default { 0.07 };
	};
	_unitInAgony setVariable ["PO3_injury_healedDamage",_healed,true];
	_unitInAgony setVariable ["PO3_injury_inAgony",false,true];
	_unitInAgony setVariable ["PO3_injury_BeingHealed",false,true];
	_unitInAgony setVariable ["PO3_injury_healer",objNull,true];
} else {
	hint "First Aid Canceled!";
	[ [_firstAider,_unitInAgony],["First Aid Cancelled",0]] call PO3_fnc_progressBar;
	_unitInAgony setVariable ["PO3_injury_BeingHealed",false,true];
	_unitInAgony setVariable ["PO3_injury_healer",objNull,true];
//	hint format ["First Aid Cancelled! time %1 alive healer %2 alive injured %3 dist %4 healinagony %5 healing status %6 vel %7", _time >= time, alive _firstAider, alive _unitInAgony, (_firstAider distance _unitInAgony) < (_curDist + 0.5), !(_firstAider getVariable ["PO3_injury_inAgony",false]), (PO3_VAR_HealingStatus), ((animationState player == "ainvpknlmstpsnonwrfldnon_medic0s") || (animationState player == "ainvpknlmstpsnonwrfldnon_medic") || (animationState player == "ainvpknlmstpsnonwrfldnon_medicup") || (animationState player == "ainvpknlmstpsnonwrfldnon_medicup0s") || (animationState player == "amovpknlmstpslowwrfldnon_amovpknlmstpsraswrfldnon"))];
	if(_firstAider == player) then { false call PO3_fnc_setActionBusy; };
	PO3_VAR_HealingStatus = false;
};

PO3_VAR_HealingStatus = false;
