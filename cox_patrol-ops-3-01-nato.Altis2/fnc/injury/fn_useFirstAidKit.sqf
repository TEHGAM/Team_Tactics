private["_unit","_items","_removedFirstAid"];

_unit = _this;
_items = items _unit;

_removedFirstAid = if (_items find "FirstAidKit" >= 0) then { _unit removeItem "FirstAidKit"; true }else{ false };

_removedFirstAid
