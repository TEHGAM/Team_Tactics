private["_lifter","_object","_local","_action","_pos"];

_object = _this select 0;
_dragger = _this select 1;

if !(_object call PO3_fnc_isDragable) exitWith { ["Drag",format["%1 is not draggable",_object], true] call PO3_fnc_log; false };

if!(local _object) then {
	_local = [_object, player] call PO3_fnc_requestOwnership;
	if(!_local) then { ["Warning: Unable to assign locality to you"] call PO3_fnc_hint };
};

if(_dragger == player) then {
	if( player call PO3_fnc_checkActionBusy ) exitWith {};
	true call PO3_fnc_setActionBusy;
};

_object attachTo [_dragger, [0,(((boundingBox _object select 1 select 1) max (-(boundingBox _object select 0 select 1))) max ((boundingBox _object select 1 select 0) max (-(boundingBox _object select 0 select 0)))) + 1,0.1] ];

_dragger setVariable ["PO3_dragged",_object,true];
_object setVariable ["PO3_dragged",_dragger,true];

[true,"HINTS",format["%1 dragged by %2",[_object] call PO3_fnc_getCfgText,[_dragger] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;

_action = _dragger addAction [format["<t color='#ffc600'>%1 %2</t>",localize "STR_PO3_TEXT_DROP",[_object] call PO3_fnc_getCfgText],{ _this call PO3_fnc_dropObject; },[],100,false,true,"","!isNull (_target getVariable [""PO3_dragged"",objNull])"];

//_dragger playMove "acinpknlmstpsraswrfldnon";
//[_dragger,"Dragger_Start"] call PO3_fnc_animateUnit;
_toofast = false;
waitUntil {
	if( abs(speed player) > 6) exitWith { _toofast = true; true };
	!alive _dragger ||
	!alive _object ||
	vehicle _dragger != _dragger ||
	!([_dragger,_object] call PO3_fnc_isDragged)
};
[_dragger,"Released"] call PO3_fnc_animateUnit;
//_dragger playAction "released";
detach _object;

if(_dragger == player) then { false call PO3_fnc_setActionBusy };

if(local _object) then { _pos = (_object) call PO3_fnc_getPos; _pos set [2,0]; _object setPos _pos; };

_dragger setVariable ["PO3_dragged",objNull,true];
_object setVariable ["PO3_dragged",objNull,true];

_dragger removeAction _action;

if(_tooFast) then {
	[true,"HINT","Moving too fast!"] call PO3_fnc_hint;
}else{
	[true,"HINTS",format["Released %1 from %2",[_object] call PO3_fnc_getCfgText,[_dragger] call PO3_fnc_getCfgText] ] call PO3_fnc_hint;
};