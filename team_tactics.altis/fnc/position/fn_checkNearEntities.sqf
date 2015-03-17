
_position	= (_this select 0) call PO3_fnc_getPos;
_radius		= if(count _this > 1) then { _this select 1 }else{ 100 };
_minCount	= if(count _this > 2) then { _this select 2 }else{ 0 };
_types		= if(count _this > 3) then { _this select 3 }else{ ["CAManBase","LandVehicle"] };
_sides		= if(count _this > 4) then { _this select 4 }else{ [(PO3_side_1 select 0),(PO3_side_2 select 0)] };
_playerFlag	= if(count _this > 5) then { _this select 5 }else{ true };

_validEntities	= [];
_nearEntities	= _position nearEntities [_types,_radius];

{
	if(
		( _playerFlag && isPlayer _x || !_playerFlag && !(isPlayer _x) )
		&& (side _x) IN _sides
		&& (alive _x)
	) then { _validEntities set [ count _validEntities, _x] };
}forEach _nearEntities;

_return = if( count _validEntities >= _minCount ) then { true }else{ false };

_return;