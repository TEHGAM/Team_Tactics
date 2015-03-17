private["_group","_unit","_return"];

_group = _this select 0;
_unit = _this select 1;

_return = if(leader _group == _unit) then { true }else{ false };

_return;