private ["_position","_side","_boxid","_boxType","_ammobox"];

_position = (_this select 0) call PO3_fnc_getPos;
_side = _this select 1;

_boxid = format["AMMOBOX%1%2%3",round (_position select 0),round (_position select 1),(round random 999)];
_boxType = ["Box_NATO_AmmoVeh_F","Box_NATO_AmmoVeh_F","Box_NATO_AmmoVeh_F"] select ([west,east,resistance] find _side);

_ammobox = createVehicle [_boxType,_position,[],0,"CAN_COLLIDE"];
_ammobox setPos _position;
_ammobox setVariable ["PO3_loadout_boxID",[_side,_boxid],true];
[_ammobox] spawn PO3_fnc_setDamageEH_C4Only;

[_side,_boxid,_ammobox] call PO3_fnc_declareAmmobox;