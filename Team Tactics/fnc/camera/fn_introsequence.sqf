if(time < 300) then {
	_bse = _this select 0;
	_rad = _this select 1;
	_alt = _this select 2;

	_pos = (player) call PO3_fnc_getPos;
	_dir = if(random 1 > 0.5) then { -1 }else{ 1 };
	_wpc = round (_rad / 12) max 5;
	_rid = round (_rad / _wpc);
	_aid = round (_alt / _wpc);
	_inc = 360/_wpc;
	_wparray = [];

	for "_i" from 0 to _wpc do {

		_ang = _bse + _inc*_dir*_i;
		_a = (_pos select 0)+(sin(_ang)*_rad);
		_b = (_pos select 1)+(cos(_ang)*_rad);

		_wparray set [count _wparray,[ [_a,_b,_alt],player,0.2,0.5,false] ];

		_rad = (_rad - _rid) max 1;
		_alt = (_alt - _aid) max 1;
	};
	_wparray spawn PO3_fnc_camera_path;
};

disableserialization;

_display = uinamespace getvariable ["PO3_screentext",objNull];
if(isNull _display) then {
	if (isnil "PO3_hudtext_n") then { PO3_hudtext_n = 2733;};
	PO3_hudtext_n cutrsc ["PO3_screentext","plain"];
	PO3_hudtext_n = PO3_hudtext_n + 1;
	_display = uinamespace getvariable ["PO3_screentext",objNull];
};

_sitrep = "|{C}o}c}a}i}n}e} }O}p}s}";
_sitrepArray = toarray _sitrep;
{_sitrepArray set [_foreachindex,tostring [_x]]} foreach _sitrepArray;

_control = _display displayctrl 860008;
_control ctrlsetstructuredtext parseText "";
_control ctrlSetBackgroundColor [0.2, 0.2, 0.2, 0.8];
_control ctrlSetFade 0;
_control ctrlCommit 0;

_control ctrlSetFade 0;
_control ctrlCommit 1;
waitUntil {ctrlCommitted _control};

_sitrep = "";
_textSize = 3;

for "_i" from 0 to (count _sitrepArray - 1) do {
	_letter = _sitrepArray select _i;

	_delay = switch ( _letter) do {
		case "|" : { _letter = "<br/>"; _textSize = _textSize - 1; 1 };
		case "{" : { _letter = format["<t color='#FFA500' size='%1'>",_textSize]; 0.05 };
		case "}" : { _letter = format["<t color='#FFFFFF' size='%1'>",_textSize]; 0.02 };
		default { _letter = format["%1%2",_letter,"</t>"]; 0.05 };
	};

	_sitrep = _sitrep + _letter;
	_control ctrlsetstructuredtext parsetext format["%1<t size='%2'>_</t>",_sitrep,_textSize];
	sleep _delay;
	if (isnull _control) exitwith {};
};

_control ctrlsetstructuredtext parsetext (_sitrep);

sleep 5;

_control ctrlSetFade 1;
_control ctrlCommit 1;

waitUntil {ctrlCommitted _control};

_control ctrlSetBackgroundColor [0, 0, 0, 0];
_control ctrlsetstructuredtext parseText "";
_control ctrlCommit 0;
