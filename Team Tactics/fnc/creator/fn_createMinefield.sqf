private["_location","_area","_targetsides","_minetype","_minecount","_xyd","_mineclass","_xAxis","_yAxis","_dir","_pos","_minesArray"];

_location	= _this select 0;
_area		= if( typename (_this select 0) == "STRING") then { (_this select 0) call PO3_fnc_getmarkershape }else{ "POS" };
_targetsides	= if( count _this > 1) then { if(typename (_this select 1) != "ARRAY") then { [_this select 1] }else{ _this select 1 } }else{ [east,west] };
_minetype	= if( count _this > 2) then { _this select 2 }else{ "AP" };
_minecount	= if( count _this > 3) then { _this select 3 }else{ 5 };
_xyd		= if( count _this > 4) then { _this select 4 }else{ nil };

_mineclass = switch (toLower _minetype) do {
	case "ap";
	case "apmine"			: { ["APERSBoundingMine","APERSMine"] };
	case "apersmine"		: { ["APERSMine"] };
	case "apersboundingmine"	: { ["APERSBoundingMine"] };
	case "at";
	case "atmine"			: { ["ATMine"] };
	case "water";
	case "watermine";
	case "underwater";
	case "underwatermine";
	case "underwatermineab"		: { ["UnderwaterMineAB","UnderwaterMine"] };
	default { ["APERSBoundingMine","APERSMine","ATMine"] };
};

if!(toUpper _area IN ["SQUARE","RECTANGLE","CIRCLE","ELLIPSE"] ) then {
	if(isNil "_xyrd") then { _xyd  = [100,100,0] };

	_xAxis = _xyd select 0;
	_yAxis = _xyd select 1;
	_dir = _xyd select 2;

	_location = createMarkerLocal ["TEMP_MINEAREA",_location call PO3_fnc_getPos];
	_location setMarkerShapeLocal "ELLIPSE";
	_location setMarkerSizeLocal [_xAxis,_yAxis];
	_location setMarkerDirLocal _dir;
};

_minesArray = [];
for "_i" from 1 to _minecount do {
	_pos = _location call PO3_fnc_getPos;
	if (surfaceIsWater _pos) then {_pos = [_pos select 0, _pos select 1, getTerrainHeightASL _pos]};

	_newmine = createMine [_mineclass call PO3_fnc_getArrayRandom, _pos, [], 0];
	_newmine setDir (random 360);
	_minesArray set [count _minesArray,_newmine];

	{ if !(_x IN _targetsides) then { _x revealMine _newmine}; } forEach [east,west,resistance];
};


_minesArray;