private["_injured","_return"];

_injured = _this select 0;

_return = if( isNull (_injured getVariable ["PO3_injury_healer",objNull]) ) then { false }else{ true };

_return