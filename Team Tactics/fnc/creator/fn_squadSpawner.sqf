/*
	Author: Community & Eightysix

	Description:
	Not to be called Directly!

*/
private ["_thisCount","_position","_side","_type","_radius","_stance","_spwngrp","_units","_strength","_skill","_unit"];

if(!PO3SRV && !PO3HLC) exitWith {};

_thisCount = count _this;

_position	= _this select 0;
_side		= _this select 1;
_type		= if(_thisCount > 2) then { _this select 2 }else{ "INF" };
_radius		= if(_thisCount > 3) then { _this select 3 }else{ 0 };
_stance		= if(_thisCount > 4) then { _this select 4 }else{ "NONE" };
_strength	= if(_thisCount > 5) then { _this select 5 }else{ 0 };

if(isNil "PO3_param_ai_skill") then { PO3_param_ai_skill = 0.67 };
_units = if( toupper(typename _type) == "STRING" ) then { _type call PO3_fnc_getpreDefinedSquads }else{ _type };
_spwngrp = createGroup _side;
if(count _units == 0 || isNull _spwngrp) exitWith { ["PO3_fnc_squadSpawner",format["ERROR No Units in List %1",_type],true] call PO3_fnc_log; grpNull };
_strength = if( toupper(typename _type) == "ARRAY" ) then { count _units }else{ if(_thisCount > 5) then { _strength }else{ count _units }; };
_position = if(_radius > 0) then { [_position,_radius,random 360] call PO3_fnc_getPos }else{ _position call PO3_fnc_getPos };

for "_j" from 0 to (_strength - 1) do {
	_unit = _spwngrp createUnit [_units select _j, _position, [], 0, "NONE"];
	_unit setSkill PO3_param_ai_skill;
	_unit allowFleeing 0;
	_unit setPos formationPosition _unit;
};
if(PO3_param_ai_easyKill) then { (units _spwngrp) spawn PO3_fnc_setDamageEH_AI; };

["PO3_fnc_squadSpawner",format["Group %1 Created at %2 with %3 Units, Skill %4",_spwngrp,_position,count (units _spwngrp),PO3_param_ai_skill] ] call PO3_fnc_log;

PO3_active_units = PO3_active_units + (units _spwngrp);

_spwngrp
