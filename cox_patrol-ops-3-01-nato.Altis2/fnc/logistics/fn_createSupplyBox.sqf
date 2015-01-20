private ["_position","_side","_boxid","_boxType","_ammobox"];

_vehicle = _this select 0;
_side = _this select 1;
_position = _vehicle call PO3_fnc_getPos;

_boxid = format["SUPPLYBOX%1%2%3",round (_position select 0),round (_position select 1),(round random 999)];
_boxType = ["B_supplyCrate_F","O_supplyCrate_F","I_supplyCrate_F"] select ([west,east,resistance] find _side);

_ammobox = createVehicle [_boxType,[0,0,0],[],0,"CAN_COLLIDE"];
_ammobox setVariable ["PO3_loadout_boxID",[_side,_boxid],true];

_dimension_max = (((boundingBox _ammobox select 1 select 1) max (-(boundingBox _ammobox select 0 select 1))) max ((boundingBox _ammobox select 1 select 0) max (-(boundingBox _ammobox select 0 select 0))));
_ammobox setPos [
	(getPos _vehicle select 0) - ( (_dimension_max + 1 - (boundingBox _vehicle select 0 select 1) ) * sin(getDir _vehicle ) ),
	(getPos _vehicle select 1) - ( (_dimension_max + 1 - (boundingBox _vehicle select 0 select 1) ) * cos(getDir _vehicle ) ),
	0
];
[_ammobox] spawn PO3_fnc_setAsDraggable;
[_ammobox] spawn PO3_fnc_setDamageEH_C4Only;

[_side,_boxid,_ammobox] call PO3_fnc_declareSupplybox;

[_ammobox,_side] spawn {
	_box = _this select 0;
	_side = _this select 1;
	waitUntil{ sleep 10; count ([_box,1000,_side,["CAManBase","LandVehicle","Air"]] call PO3_fnc_getNearbyPlayers) == 0 };
	[_side,"SIDE",format["Supplybox GRID:%1 has been recovered",mapGridPosition _box]] call PO3_fnc_sendChat;
	deleteVehicle _box;
};

[player,"HINT","Вы создали ящик с аммуницией<br/><br/>Вы можете перевозить его с помощью вертолетов или грузовиков.<br/><br/>Он пропадет, как только игроки отойдут от него на некоторое расстояние."] call PO3_fnc_hint;