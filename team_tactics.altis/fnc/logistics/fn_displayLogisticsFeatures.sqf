private["_vehicle","_loaderSize","_objectSize","_text"];

_vehicle = _this select 0;

if( player != driver _vehicle ) exitWith {};

_loaderSize = 0;
_objectSize = 0;

{ if( _vehicle isKindOf (_x select 0) && _loaderSize == 0 ) then { _loaderSize = _x select 1 } }forEach PO3_CfgLogistics_Loadable;
{ if( _vehicle isKindOf (_x select 0) && _objectSize == 0 ) then { _objectSize = _x select 1 } }forEach PO3_CfgLogistics_Liftable;

_text = format["<img image='%1' size='2'/><br/>%2<br/><br/>",[_vehicle] call PO3_fnc_getCfgPicture, [_vehicle] call PO3_fnc_getCfgText];
if( _objectSize > 0 ) then { _text = _text + format[localize "STR_PO3_LOGIST_VEHWEIGHT",_objectSize] };
if( _loaderSize > 0 ) then { _text = _text + format[localize "STR_PO3_LOGIST_VEHCPACTY",_loaderSize] };

[true,"HINT",_text] call PO3_fnc_hint;