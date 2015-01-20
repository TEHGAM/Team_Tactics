private["_position","_radius","_side","_types","_nearEntities","_validEntities"];

_position	= (_this select 0) call PO3_fnc_getPos;
_radius		= if(count _this > 1) then { _this select 1 }else{ 100 };
_sides		= if(count _this > 2) then { _this select 2 }else{ [(PO3_side_1 select 0),(PO3_side_2 select 0)] };
_types		= if(count _this > 3) then { _this select 3 }else{ ["CAManBase","LandVehicle"] };

if(typeName _sides != typeName [] ) then { _sides = [_sides] };
if(typeName _types != typeName [] ) then { _types = [_types] };

_validEntities	= [];
_nearEntities	= _position nearEntities [_types,_radius];
{
	if( (side _x) IN _sides && (alive _x) ) then { _validEntities set [ count _validEntities, _x] };
}forEach _nearEntities;

_validEntities