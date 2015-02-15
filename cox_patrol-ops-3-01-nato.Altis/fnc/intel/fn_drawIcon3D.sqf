private["_countThis","_icon","_colour","_pos","_sizeX","_sizeY","_dir","_title","_shadow","_sizeT","_font"];

_countThis = count _this;
_icon	= if(_countThis > 0) then { _this select 0 }else{ "" };
_colour	= if(_countThis > 1) then { _this select 1 }else{ [0,0,0,0] };
_pos	= if(_countThis > 2) then { _this select 2 }else{ [0,0,0] };
_sizeX	= if(_countThis > 3) then { _this select 3 }else{ 1 };
_sizeY	= if(_countThis > 4) then { _this select 4 }else{ 1 };
_dir	= if(_countThis > 5) then { _this select 5 }else{ 0 };
_title	= if(_countThis > 6) then { _this select 6 }else{ "" };
_sizeT	= if(_countThis > 7) then { _this select 7 }else{ 0.03 };

drawIcon3D [_icon,_colour,_pos,_sizeX,_sizeY,_dir,_title,1,_sizeT,"PuristaLight"];

true;