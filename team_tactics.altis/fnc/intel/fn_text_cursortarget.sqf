/*
	Author: Eightysix

	Description:
	Display CusrorTarget Info
*/
if(isNil "PO3_enable_text_cursorTarget") then { PO3_enable_text_cursorTarget = true };
if(!isNil "PO3_tempscript_screentext") then { terminate PO3_tempscript_screentext };
if(!PO3_enable_text_cursorTarget) exitWith {};

PO3_tempscript_screentext = _this spawn {
	disableSerialization;

	_player = _this select 0;
	if(isNull _player) exitWith {};

	_sitrep = format [
		"%2",
		toUpper localize format ["STR_SHORT_%1",rank _player],
		toUpper name _player
	];

	_sitrepArray = toArray _sitrep;
	{_sitrepArray set [_foreachindex,toString [_x]]} forEach _sitrepArray;
	_sitrep = "";
	_sitrepFormat = "<t align=""Center"" shadow='1'>%1</t>";

	_display = uiNamespace getVariable ["PO3_screentext_sitrep_text",objNull];
	if(isNull _display) then {
		if (isNil "PO3_hudtext_n") then { PO3_hudtext_n = 2733;};
		PO3_hudtext_n cutRsc ["PO3_screentext_sitrep","plain"];
		PO3_hudtext_n = PO3_hudtext_n + 1;
		_display = uiNamespace getVariable ["PO3_screentext_sitrep_text",objNull];
	};

	PO3_text_sitrep1_display = true;

	_control = _display displayCtrl 860007;
	_control ctrlSetStructuredtext parseText "";
	_control ctrlSetBackgroundColor [0, 0, 0, 0.6];
	_control ctrlSetFade 0.3;
	_control ctrlCommit 0;

//	if(!isNil "BIS_DEBUG_CAM") exitWith{ _control ctrlSetFade 1; _control ctrlCommit 0;};

	for "_i" from 0 to (count _sitrepArray - 1) do {
		_letter = _sitrepArray select _i;
		_delay = if ( _letter == "|" ) then { _letter = "<br />"; 1 } else { 0.01 };
		_sitrep = _sitrep + _letter;
		_control ctrlSetStructuredtext parseText format [_sitrepFormat,_sitrep + "_"];
		sleep _delay;
		if (isNull _control) exitWith {};
	};

	_control ctrlSetStructuredtext parseText format [_sitrepFormat,_sitrep];
	sleep 1;
	_control ctrlSetFade 1;
	_control ctrlCommit 1;
	waitUntil {ctrlCommitted _control};
	_control ctrlSetstructuredtext parseText "";

	PO3_text_sitrep1_display = false;
};