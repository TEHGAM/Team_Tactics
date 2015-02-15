private["_countThis","_display","_position","_xAxis","_yAxis","_angle","_colour","_fill"];

_countThis	= count _this;
_display	= _this select 0;
_position	= _this select 1;
_xAxis	= (_this select 2) select 0;
_yAxis	= (_this select 2) select 1;
_angle	= _this select 3;
_colour	= if(_countThis > 4) then { _this select 4 }else{ [0,0,0,1] };
_fill	= if(_countThis > 5) then { _this select 5 }else{ "" };

_display drawEllipse [_position, _xAxis, _yAxis, _angle, _colour, _fill];

true;