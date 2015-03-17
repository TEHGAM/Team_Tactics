private["_unit","_items","_hasMedical"];

_unit = _this;
_items = items _unit;

_hasMedical = if (_items find "Medikit" >= 0) then { true  }else{ false };

_hasMedical;