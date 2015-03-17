private["_typename","_type","_nextloc","_return","_loc"];

if( isNil "PO3_pos_curr" ) then { PO3_pos_curr = [0,0,0] };
if( isNil "PO3_pos_used" ) then { PO3_pos_used = [] };
if( isNil "PO3_pos_prev" ) then { PO3_pos_prev = [0,0,0] };
if( isNil "PO3_pos_allowed" ) then { PO3_pos_allowed = call PO3_fnc_regLocations };

_type = if( typename _this == typeName [] ) then { _this call PO3_fnc_getArrayRandom }else{ _this };

if( count PO3_pos_allowed <= 0) exitWith { [ [0,0,0], "", 0 ] };
if( count PO3_pos_used >= count PO3_pos_allowed ) then { PO3_pos_used = [] };

_locations = switch (toLower _type) do {
	case "base" : { PO3_pos_allowed select 0 };
	case "city" : { PO3_pos_allowed select 1 };
	case "hill" : { PO3_pos_allowed select 2 };
	case "town" : { PO3_pos_allowed select 3 };
	case "bay";
	case "water";
	case "underwater" : { PO3_pos_allowed  select 4 };
	case "poi" : { PO3_pos_allowed select 5 };
	case "airport" : { PO3_pos_allowed select 6 };
	default { PO3_pos_allowed select 7 };
};

_worldradius = 1500*Log(PO3_worldsize/1000);

PO3_pos_curr  = nil;
_refDistance = 1e+9;
_minRadius = 2e+3;
while { isNil "PO3_pos_curr" } do {
	PO3_pos_curr = (_locations  call PO3_fnc_getArrayRandom) select 0;
	_distance = PO3_pos_curr distance PO3_pos_prev;
	if( _distance < _refDistance && _distance > _minRadius) then {
		if(_distance < (_minRadius*1.5) && random 1 > 0.5 && !(PO3_pos_curr IN PO3_pos_used)) exitWith {};
		_refDistance = _distance;
	};
	if !(PO3_pos_curr IN PO3_pos_used) exitWith { PO3_pos_curr };
	PO3_pos_curr = nil; _minRadius = _minRadius + 2e+3;
};
PO3_pos_used set [count PO3_pos_used, PO3_pos_curr];

_return = [];
switch (toLower _type) do {
	case "base";
	case "city";
	case "town";
	case "poi" : {
		_pos = [PO3_pos_curr,0,0,false] call PO3_fnc_getPos; _pos set [2,0];
		_return set [0,_pos];
		_return set [1,text PO3_pos_curr];
		_return set [2,size PO3_pos_curr];
	};
	case "airport" : {
		_pos = [PO3_pos_curr,0,0,false] call PO3_fnc_getPos; _pos set [2,0];
		_return set [0,_pos];
		_return set [1,text PO3_pos_curr];
		_return set [2,size PO3_pos_curr];
	};
	case "hill" : {
		_loc = [PO3_pos_curr,10] call PO3_fnc_getFlatArea;
		_pos = [_loc,0,0,false] call PO3_fnc_getPos; _pos set [2,0];
		_return set [0,_pos];
		_return set [1,mapGridPosition (_return select 0)];
		_return set [2,50];
	};
	case "water";
	case "bay" : {
		_loc = [PO3_pos_curr,0,0,true] call PO3_fnc_getPos;
		_loc set [2,0];
		_return set [0,_loc];
		_return set [1,mapGridPosition (_return select 0)];
		_return set [2,0];
	};
	case "underwater" : {
		_loc = [PO3_pos_curr,0,0,true] call PO3_fnc_getPos;
		_loc set [2,-15];
		_return set [0,_loc];
		_return set [1,mapGridPosition (_return select 0)];
		_return set [2,0];
	};
	default {
		_loc = [PO3_pos_curr,0,0,false] call PO3_fnc_getPos;
		_loc set [2,0];
		_return set [0,_loc];
		_return set [1,mapGridPosition (_return select 0)];
		_return set [2,0];
	};
};

["PO3_fnc_getNewPos",format["Returned: %1",_return]] spawn PO3_fnc_log;

PO3_pos_prev = _return select 0;

_return