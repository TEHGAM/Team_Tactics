private["_object","_packer","_position","_direction","_containerClass","_objectClass","_container"];

_packer = _this select 0;
_object	= nearestObjects[ position _packer, ["Land_TTowerBig_2_F","Land_Communication_F"], 20] select 0;

if(isNil "_object") exitWith {};

if(_packer == player) then {
	if( player call PO3_fnc_checkActionBusy ) exitWith {};
	true call PO3_fnc_setActionBusy;
};

_position = _object call PO3_fnc_getPos; _position set [2,0];
_direction = direction _object;

_containerClass = _object getVariable ["PO3_packedClass","Land_Cargo20_military_green_F"];
_objectClass = typeOf _object;

_object setVariable ["PO3_isPackable",false,true];

[true,"HINT",format[localize "STR_PO3_LOGIST_OBJPACKIOBJ",[_object] call PO3_fnc_getCfgText,[_containerClass] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;

[_packer,"Pack_Object"] call PO3_fnc_animateUnit;// playMove "AinvPknlMstpSlayWrflDnon_medic";

_timer = 8;
waitUntil { sleep 1; _timer = _timer - 1;
	_timer <= 0
	|| !(alive _object)
	|| !(alive _packer)
};
[_packer,"Pack_Stop"] call PO3_fnc_animateUnit;

if(_packer == player) then { false call PO3_fnc_setActionBusy };
if !(_timer <= 0) exitWith { _object setVariable ["PO3_isPackable",true,true] };

deleteVehicle _object;
_container = createVehicle [_containerClass,_position,[],0,"NONE"];
_container setPosATL _position;
_container setDir _direction;
_container setVariable ["PO3_packedClass",_objectClass,true];
_container setVariable ["PO3_isPackable",true,true];

_container