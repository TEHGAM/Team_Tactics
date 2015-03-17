private["_group","_title"];

_group = _this select 0;
_title = _this select 1;

_group setGroupId [format["%1",_title] ];

["PO3_fnc_setGroupID",format ["Changed Group ID TO %1", (_this select 1)]] call PO3_fnc_log;

true