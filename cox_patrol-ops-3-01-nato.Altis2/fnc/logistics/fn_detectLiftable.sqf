private["_vehicle"];

_vehicle = _this select 0;

while { PO3_logistics_lifthook_active && _vehicle == (vehicle player) } do {

	_classes = [];
	{ _classes set [count _classes,_x select 0] }forEach PO3_CfgLogistics_Liftable;

	_list = nearestObjects [position (vehicle player),_classes,50];

	{
		_veh = _x;
		if( [(vehicle player),_veh] call PO3_fnc_isLiftable ) then {
			[_veh] call PO3_fnc_setAsLiftable;
		};
	}forEach _list;
	sleep 10;
};