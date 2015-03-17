// Written by EightySix
private["_heligrp","_spawnpos","_dest","_paradrop","_flyin","_droptype","_invisibleTarget","_helo","_drophelo","_drophelogrp","_helopilot"];

_helogrp = _this select 0;
_spawnpos = (_this select 1) call mps_get_position; sleep 1;
_dest = (_this select 2) call mps_get_position;
_paradrop = false;
if(count _this > 3) then { _paradrop = _this select 3};

_flyin = 200;
_droptype = (mps_opfor_ncoh) call mps_getRandomElement;
_invisibleTarget = PO3_reference_heliempty createVehiclelocal _dest;

if(count (units _helogrp) == 0) then {_heligrp = [_spawnpos,"INF",(8 + random 5),10] call CREATE_OPFOR_SQUAD; };
if(_droptype isKindof "Plane" || count _this > 3) then { _paradrop = true };

_dest = [_dest, 0, 200, 10, 0, .5, 0] call BIS_fnc_findSafePos;
_string = format _dest; if (!isNil "_string") then { _invisibleTarget setPos _dest; };

_helo = [ [_spawnpos select 0, _spawnpos select 1, _flyin], random 360, _droptype, (SIDE_B select 0)] call BIS_fnc_spawnVehicle;

_drophelo = _helo select 0;
_drophelogrp = _helo select 2;
_drophelo setDammage 0;
_drophelo setFuel 1;
_drophelo flyInHeight _flyInHeight;
_helopilot = driver _drophelo;
_helopilot setSkill 1;
_helopilot disableAI "TARGET";
_helopilot disableAI "AUTOTARGET";

{_x assignAsCargo _drophelo; _x moveInCargo _drophelo} forEach (Units _helogrp);

{ if(vehicle _x == _x) then { _x setDamage 1; }; }forEach (units _helogrp);

if (!isEngineOn _drophelo && alive _helopilot) then {
	if (!canMove _drophelo) then {
		_drophelo setDammage 0;
		_drophelo setFuel 1;
		sleep 1;
	};
	_helopilot action ["engineOn", vehicle _helopilot];
};

_helopilot doMove _dest;

waitUntil { _drophelo distance _dest <= 250 || !canMove _drophelo || !alive _helopilot };

if(_paradrop || !(toupper (behaviour _helopilot) IN ["CARELESS","SAFE","AWARE"]) ) then {
	{	if( (assignedVehicleRole _x) select 0 == "Cargo")then {
			unassignVehicle _x;
			_x action ["EJECT", vehicle _x];
			_x stop false;
			[_x] allowGetIn false;
		};
		sleep 0.5;
	} forEach (units _helogrp);
}else{
	waitUntil{unitReady _drophelo || !canMove _drophelo || !alive _helopilot};

	_drophelo land "Land";
	waituntil {!alive _drophelo || ((abs(velocity _drophelo select 2)) <= 1 && ((position _drophelo) select 2) <= 0.7)};
	{	if( (assignedVehicleRole _x) select 0 == "Cargo")then {
			unassignVehicle _x;
			_x action ["getOut", vehicle _x];
			_x stop false;
			[_x] allowGetIn false;
		};
		sleep 0.5;
	} forEach (units _helogrp);
};

[_helogrp,_dest,"patrol"] execFSM (mps_path+"fsm\mps_patrol.fsm");

_drophelo land "NONE";
sleep 2;
_helopilot doMove _spawnpos;

waitUntil {_drophelo distance _spawnpos <= 200 || !canMove _drophelo || !alive _helopilot};

{ _x action ["EJECT", vehicle _x]; sleep 0.2; deleteVehicle _x; } forEach (crew _drophelo);
deleteVehicle _drophelo;
deleteGroup _drophelogrp;