// Written by EightySix
if(!PO3SRV || !isNil "PO3_VAR_ambientAirPatrols_active") exitWith{};
PO3_VAR_ambientAirPatrols_active = true;

waitUntil { !isNil "PO3_pos_allowed" };

_wparray = [];
{
	_pos = (_x select 0) call PO3_fnc_getPos;
	_wparray set [count _wparray,_pos];
} foreach ((PO3_pos_allowed select 1)+(PO3_pos_allowed select 3));

_wparray = _wparray call PO3_fnc_arrayShuffle;

_script = _wparray spawn {
	private["_class","_vehicle","_group","_airframe","_position","_wp","_spawnpos"];
	While { true } do{

		_spawnpos = [(_this call PO3_fnc_getArrayRandom),0,0,true] call PO3_fnc_getPos;
		_class = [1] call PO3_fnc_getVehicleTypes;
		if(count _class == 0) exitWith { ["ERROR in Ambient Air Patrols -> No Valid Aircraft"] call PO3_fnc_hint };

		_vehicle = [ _spawnpos, _class call PO3_fnc_getArrayRandom, random 360, 1000, (PO3_side_3 select 0), [], "FLY"] call PO3_fnc_createVehicle;
		_group = _vehicle select 0;
		_airframe = _vehicle select 1;

		{
			_position = [_x,0,0,true] call PO3_fnc_getPos;
			_wp = _group addWaypoint [_position,150];
			_wp setWaypointCompletionRadius 200;

			if(_forEachIndex == 0) then {
				_wp setWaypointSpeed "NORMAL";
				_wp setWaypointBehaviour "SAFE";
				_wp setWaypointFormation "STAG COLUMN";
			};

			if(PO3_debug) then {
				_marker = createMarkerlocal [format["PO3_temp_ap%1",_x],_x];
				_marker setMarkerTypelocal "mil_dot";
				_marker setMarkersizelocal [0.3,0.3];
				_marker setMarkerTextlocal ("AIR" + str _forEachIndex);
			};
			if(_forEachIndex > 12) exitWith {};
		} foreach _this;

		_wp = _group addWaypoint [waypointPosition [_group,0],100];
		_wp setWaypointType "CYCLE";

		_airframe flyInHeight 40;

		["PO3_fnc_ambientAirPatrols",format["Created %1 in %2",_group,_airframe] ] call PO3_fnc_log;

		while { if(!isNil "_airframe") then { damage _airframe < 1 }else{ false } } do { sleep 30 };

		sleep 300;

		if(!isNil "_airframe") then { deleteVehicle _airframe; _airframe = nil; };

		{ deleteVehicle _x }forEach (units _group);
		deletegroup _group;
	};
};