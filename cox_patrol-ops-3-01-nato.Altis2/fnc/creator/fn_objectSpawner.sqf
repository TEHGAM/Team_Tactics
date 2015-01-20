/*
	Author: Community & Eightysix

	Description:
	Not to be called Directly!

*/
private ["_type","_side","_position","_dir","_radius","_vehicle","_grp","_crewtype","_max","_unit"];

if(!PO3SRV && !PO3HLC) exitWith {};


_position	= _this select 0;
_type		= _this select 1;
_dir		= if(count _this > 2) then { _this select 2 }else{ random 360 };
_radius		= if(count _this > 3) then { _this select 3 }else{ 0 };
_side		= if(count _this > 4) then { _this select 4 }else{ nil };

_position = if(_radius > 0) then { [_position,_radius] call PO3_fnc_getPos }else{ _position call PO3_fnc_getPos };

_vehicle = createVehicle [_type, _position, [], _radius, "NONE"];
_vehicle setDir _dir;

if(isNil "_side") exitWith{
	["PO3_fnc_objectSpawner",format["Empty Object %1 created at %2",_vehicle,_position] ] call PO3_fnc_log;
	_vehicle;
};

_grp = createGroup _side;

_crewtype = getArray (configFile >> "CfgVehicles" >> _type >> "typicalCargo");
if( count(_crewtype - ["Soldier"]) == 0 ) then{
	_crewtype = switch (_side) do {
		case resistance : { [PO3_CfgSpawner_DefaultCrewTypes select 2] };
		case east : { [PO3_CfgSpawner_DefaultCrewTypes select 1] };
		default { [PO3_CfgSpawner_DefaultCrewTypes select 0] };
	};
};
_max = (count _crewtype) - 1;

if( (_vehicle emptyPositions "commander") > 0 ) then {
	_unit = _grp createUnit [_crewtype select (round random _max), _position, [], _radius, "NONE"];
	_unit setSkill PO3_param_ai_skill;
	_unit allowFleeing 0;
	_unit moveinCommander _vehicle;
};

if( ( _vehicle emptyPositions "gunner") > 0 ) then {
	_unit = _grp createUnit [_crewtype select (round random _max), _position, [], _radius, "NONE"];
	_unit setSkill PO3_param_ai_skill;
	_unit allowFleeing 0;
	_unit moveinGunner _vehicle;
};

if( ( _vehicle emptyPositions "driver") > 0 ) then {
	_unit = _grp createUnit [_crewtype select (round random _max), _position, [], _radius, "NONE"];
	_unit setSkill PO3_param_ai_skill;
	_unit allowFleeing 0;
	_unit moveinDriver _vehicle;
};

if(PO3_param_ai_easyKill) then { (units _grp) spawn PO3_fnc_setDamageEH_AI; };

["PO3_fnc_objectSpawner",format["Object Group %1 Created at %2 with %3 Units in a %4, Skill %5",_grp,_position,count (units _grp),_type,PO3_param_ai_skill] ] call PO3_fnc_log;

PO3_active_units = PO3_active_units + (units _grp) + [_vehicle];

[_grp,_vehicle]