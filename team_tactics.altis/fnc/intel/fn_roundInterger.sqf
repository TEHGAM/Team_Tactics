
_this = 0 max (_this*100) min 100;

if (_this < 1) exitWith {ceil _this};
if (_this > 99) exitWith {floor _this};

round (_this/100)
