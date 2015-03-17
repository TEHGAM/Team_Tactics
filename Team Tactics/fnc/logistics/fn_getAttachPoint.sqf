private["_object","_point","_position","_box"];

_object = _this select 0;
_point = _this select 1;

_position = position _object;
_box = boundingBoxReal _object;

// [[minX, minY, minZ], [maxX, maxY, maxZ]]
_xmin = (_box select 0) select 0;
_ymin = (_box select 0) select 1;
_zmin = (_box select 0) select 2;
_xmax = (_box select 1) select 0;
_ymax = (_box select 1) select 1;
_zmax = (_box select 1) select 2;

_x = _xmin + ((_xmax - _xmin)/2);
_y = _ymin + ((_ymax - _ymin)/2);
_z = switch (toLower _point) do {
	case "base";
	case "bottom";
	case "low";
	case "hook" : { _zmin };
	case "high";
	case "top";
	case "roof";
	case "rope" : { _zmax };
};

_offset = [ _x - (_position select 0), _y - (_position select 1), _z - (_position select 0)];
_offset;