private["_countThis","_display","_icon","_colour","_pos","_sizeX","_sizeY","_dir","_title","_shadow","_sizeT","_font"];

_countThis = count _this;
_display = _this select 0;
_icon	= _this select 1;
_colour	= _this select 2;
_pos	= _this select 3;
_sizeX	= _this select 4;
_sizeY	= _this select 5;
_dir	= _this select 6;
_title	= _this select 7;
_shadow	= if(_countThis >  8) then { _this select 8 }else{ 1 };
_sizeT	= if(_countThis >  9) then { _this select 9 }else{ 0.03 };
_font	= if(_countThis > 10) then { _this select 10 }else{ "PuristaLight" };
_align	= if(_countThis > 11) then { _this select 11 }else{ "Right" };

_display drawIcon [_icon,_colour,_pos,_sizeX,_sizeY,_dir,_title,_shadow,_sizeT,_font];

true;