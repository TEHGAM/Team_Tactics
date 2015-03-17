/*
	Author: Shuko Modified by Eightysix

	{COMPRESSED}

	Description:
	Do Not Call Directly
*/
private ["_marker","_size","_x","_y","_return"];

_marker = _this;
_size = markersize _marker;
_x = _size select 0;
_y = _size select 1;

_return = switch (tolower(markershape _marker)) do {
	case "rectangle": { if (_x == _y) then {"SQUARE"} else {"RECTANGLE"} };
	case "ellipse": { if (_x == _y) then {"CIRCLE"} else {"ELLIPSE"} };
	case "icon": { "ICON" };
	default { nil };
};

_return