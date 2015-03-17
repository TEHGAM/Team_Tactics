private["_markers"];

_markers = if(typename _this != "ARRAY") then { [_this] }else{ _this };

{
	if(Local _x) then {
		_x setMarkerAlpha 0;
	}else{
		_x setMarkerAlphaLocal 0;
	};
}forEach _markers;