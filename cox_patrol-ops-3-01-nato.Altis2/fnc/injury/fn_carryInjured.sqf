private["_injured","_dragger"];

_injured = _this select 0;
_dragger = _this select 1;

_injured attachTo [_dragger, [0, 1.1, 0.092]];
_injured setDir 180;
_injured setVariable ["PO3_injury_dragger",_dragger, true];

_dragger playMoveNow "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon";
_dragAction = _dragger addAction [format["<t color=""#FFC600"">Drop %1</t>",name _injured],{ _this call PO3_fnc_dropInjured }, _injured, 1, true, true, "", "true"];

waitUntil{
	!(alive _injured) ||
	!(alive _dragger) ||
	_injured getVariable ["PO3_injury_dragger",objNull] == _dragger
};

detach _injured;
_injured switchMove "AinjPpneMstpSnonWrflDnon";
_injured setVariable ["PO3_injury_dragger",objNull,true];

player playMove "amovpknlmstpsraswrfldnon";
player removeAction _dragAction;