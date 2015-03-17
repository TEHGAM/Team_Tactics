private["_countThis","_display","_pos1","_pos2","_colour"];

_countThis = count _this;
_display = _this select 0;
_pos1	= _this select 1;
_pos2	= _this select 2;
_colour	= if(_countThis > 3) then { _this select 3 }else{ [0,0,0,1] };

_display drawArrow [_pos1, _pos2, _colour];

true;