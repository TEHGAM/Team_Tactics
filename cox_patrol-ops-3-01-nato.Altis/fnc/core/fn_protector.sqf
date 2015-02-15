_positions = [
	format["respawn_%1",PO3_side_1 select 0] call PO3_fnc_getPos,
	format["respawn_%1",PO3_side_2 select 0] call PO3_fnc_getPos,
	format["respawn_%1",PO3_side_3 select 0] call PO3_fnc_getPos
];

for "_i" from 0 to 2 do {
	_pos = _positions select _i;

	_nearbyBuildings = nearestObjects [_pos, ["building"], 100];
	{
		_x allowDamage false;
	//	_x enableSimulation false;
	}forEach _nearbyBuildings;
};

if(isNil "PO3_protector_enable") then { PO3_protector_enable = false };

/* [] spawn {
	while {true} do {
		_state = [ format["respawn_%1",PO3_side_1 select 0] call PO3_fnc_getPos,500,1,["CAManBase","LandVehicle","AIR"],[(PO3_side_3 select 0)],false] call PO3_fnc_checkNearEntities;
		if (_state) then {
			PO3_protector_enable = false;
//			[player,"COMMAND","Enemy Forces detected near base. Base Anti Fire Disabled"] call PO3_fnc_chat;
		}else{
			PO3_protector_enable = true;
//			[player,"COMMAND","Enemy Forces cleared. Base Anti Fire Enabled"] call PO3_fnc_chat;
		};
		waitUntil {
			sleep 5;
			_state && !([ format["respawn_%1",PO3_side_1 select 0] call PO3_fnc_getPos,500,0,["CAManBase","LandVehicle","AIR"],[(PO3_side_3 select 0)],false] call PO3_fnc_checkNearEntities) ||
			!_state && ([ format["respawn_%1",PO3_side_1 select 0] call PO3_fnc_getPos,500,0,["CAManBase","LandVehicle","AIR"],[(PO3_side_3 select 0)],false] call PO3_fnc_checkNearEntities)
		};
	};
}; */