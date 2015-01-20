private["_types"];
_types = _this;
_array = [];
{ _array = _array + (PO3_preDefinedEnemyVehicles select _x) }forEach _types;
_array;