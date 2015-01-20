private["_unit","_items","_hasFirstAid"];

_unit = _this;
_items = items _unit;

_hasFirstAid = if (_items find "FirstAidKit" >= 0) then { true }else{ false };

_hasFirstAid;
