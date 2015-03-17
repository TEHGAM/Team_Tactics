private["_unit","_items","_removedMedikit"];

_unit = _this;
_items = items _unit;

_removedMedikit = if (_items find "Medikit" >= 0) then { player removeItem "Medikit"; true }else{ false };

_removedMedikit
