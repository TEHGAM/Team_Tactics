/*
if !(PO3SRV) exitWith {};
private ["_ieds","_posarray","_offset","_ied"];

PO3_fnc_getIEDNewPos = {
	private["_ieds","_positions","_return"];

	_ieds = _this select 0;
	_positions = _this select 1;
	_return = objNull;

	for "_i" from 1 to (count _positions) do {
		_road = _positions select (_i - 1);

		if( count (position _road) nearEntities ["CAManBase",1000] == 0 ) then {
			if( { _road  distance _x > 100 } count _ieds > 0 ) exitWith {
				_return = _road;
			};
		};
	};

	_return;
};

_ieds = [];
_posarray = [0,0] nearRoads 100000;

while { PO3_IED_counter > } do {
	_posarray = _posarray call PO3_fnc_arrayShuffle;

	_pos = [_ieds,_posarray] call PO3_fnc_getIEDNewPos;

};

for "_i" from 1 to mps_ied_count do {

	if(not isNil "_iedpos") then {
		_roads = _roads - [_iedpos];
		_iedpositions = _iedpositions + [_iedpos];
		_j = (count mps_ieds - 1) min (round random (count mps_ieds));
		_ied = (mps_ieds select _j) createVehicle [(position _iedpos) select 0,(position _iedpos) select 1, 0];
		if(random 2 > 1) then {_offset = [-7.5 - random 3,0,0]} else {_offset = [7.5 + random 3,0,0]};
		_ied setPosATL (_iedpos modelToWorld _offset);
		_ied setVariable ["mps_ied",true,true];
		_ied execFSM (mps_path+"fsm\mps_ied_sensor.fsm");

		if(random 1 > 0.6 && mps_ambient_insurgents) then {
			_ied spawn {
				waitUntil{ { side _x == (SIDE_A select 0) } count nearestObjects[position _this,["Man","LandVehicle"],800] > 0 && alive _this };
				_grp = [position _this,"INS",(2 + random 4),20,"standby"] call CREATE_OPFOR_SQUAD;
			};
		};

		_iedpos = nil;
		_ied = nil;
	};
};

if(mps_debug) then {
	{ (createMarkerLocal [str round random 999999,position _x]) setMarkerTypeLocal "dot"; } foreach _iedpositions;
};


["MARKIED",9] call PO3_fnc_createIED;*/