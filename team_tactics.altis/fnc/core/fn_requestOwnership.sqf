if!(PO3CLI) exitWith {};

private["_object","_requestor","_timer","_return"];

_object = _this select 0;
_requestor = _this select 1;

if(local _object) exitWith { true };

PO3_brdcst_serverRequest = false;
PO3_brdcst_requestOwnerChange = [_object,_requestor]; publicVariableServer "PO3_brdcst_requestOwnerChange";

_timer = 3;
waitUntil { _timer = _timer - 1; (_timer <= 0 || PO3_brdcst_serverRequest) };

_return = if(local _object) then { true }else{ false };

_return;