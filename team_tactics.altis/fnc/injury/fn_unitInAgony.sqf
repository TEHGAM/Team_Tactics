private["_unitInAgony"];

_unitInAgony = _this select 0;

_group = group _unitInAgony;
_side = side _group;

// Check if Unit Already in Agony
if(_unitInAgony getVariable ["PO3_injury_inAgony",false]) exitWith {};

// If is player then set as busy
if(_unitInAgony == player) then { true call PO3_fnc_setActionBusy };

//apply a blood effect, this gets over written by the setdamage later
//_unitInAgony setHit ["hands",1];
//_unitInAgony setHit ["legs",1];
[_unitInAgony] spawn PO3_fnc_injuredEffects;

// Begin Bloodloss FSM
[_unitInAgony] spawn PO3_fnc_injuredBloodLoss;

// Broadcast Damage LOCAL Variable as new PUBLIC Varaible
_unitInAgony setVariable ["PO3_injury_healedDamage", _unitInAgony getVariable ["PO3_injury_totalDamage",0],true];
_unitInAgony setVariable ["PO3_injury_inAgony",true,true];

// Broadcast Side Message of player is in Agony
[_side,"SIDE",format[localize "STR_PO3_INJURY_ISDOWN",name _unitInAgony,mapGridPosition _unitInAgony] ] call PO3_fnc_sendChat;

// If inside a vehicle and the vehicle is moving slowly, bail out
if( vehicle _unitInAgony != _unitInAgony && speed (vehicle _unitInAgony) <= 1 ) then {
	unAssignVehicle _unitInAgony;
	_unitInAgony action ["eject", vehicle _unitInAgony];
	sleep 2;
	waitUntil{ _unitInAgony == vehicle _unitInAgony && ((position _unitInAgony) select 2) < 1 };
	_unitInAgony setVelocity [0,0,0];
};

// Begin Injured Animation
[_unitInAgony,"Injured_AgonyStart"] call PO3_fnc_animateUnit;

//_unitInAgony allowDamage false;
waitUntil{
	sleep 1;
	// If unit moves into a vehicle, Kick them out
	if(vehicle _unitInAgony != _unitInAgony) then {
		unAssignVehicle _unitInAgony;
		_unitInAgony action ["eject", vehicle _unitInAgony];
		sleep 2;
		_unitInAgony setVelocity [0,0,0];
		[true,"HINTS","You are too injured to be transported"] call PO3_fnc_hint;
		[_unitInAgony,"Injured_AgonyStart"] call PO3_fnc_animateUnit;
	};
	// If unit tries to stand, put them down
	if !(stance player == "PRONE") then {
		[true,"HINT","You are too injured to Stand"] call PO3_fnc_hint;
		_unitInAgony switchMove "";
		[_unitInAgony,"Injured_AgonyStart"] call PO3_fnc_animateUnit;
	};

	if (_unitInAgony getVariable ["PO3_injury_BeingHealed",false]) then {
		//_unitInAgony enablesimulation false;
	}else{
		//_unitInAgony enablesimulation true;
	};
	// Waituntil Unit is not in agony or is dead
	!(_unitInAgony getVariable ["PO3_injury_inAgony",false]) || !(alive _unitInAgony)
};
// Reenable Simulation
_unitInAgony enablesimulation true;
// Make sure they can take damage
_unitInAgony allowDamage true;
// Reset their Agony State
_unitInAgony setVariable ["PO3_injury_inAgony",false,true];
// Reset Action state
if(_unitInAgony == player) then { false call PO3_fnc_setActionBusy; };
// If alive, Animate then set their damage
if(alive _unitInAgony) then {
	[_unitInAgony,"Injured_AgonyEnd"] call PO3_fnc_animateUnit;

	_unitInAgony setVariable ["PO3_injury_totalDamage",_unitInAgony getVariable ["PO3_injury_healedDamage",0],false];
	_unitInAgony setDamage (_unitInAgony getVariable ["PO3_injury_healedDamage",0]);

	if !(isNull (_unitInAgony getVariable ["PO3_injury_healer",objNull])) then {
		[_group,"SIDE",format[localize "STR_PO3_INJURY_ISUP1",name _unitInAgony,name (_unitInAgony getVariable ["PO3_injury_healer",objNull])] ] call PO3_fnc_sendChat;
	}else{
		[_group,"SIDE",format[localize "STR_PO3_INJURY_ISUP2",name _unitInAgony] ] call PO3_fnc_sendChat;
	};
}else{
	[_group,"GROUP",format[localize "STR_PO3_INJURY_ISNOTUP",name _unitInAgony] ] call PO3_fnc_sendChat;
};
// Resert Unit Variables
_unitInAgony setVariable ["PO3_injury_dragger",objNull,true];
_unitInAgony setVariable ["PO3_injury_healer",objNull,true];
