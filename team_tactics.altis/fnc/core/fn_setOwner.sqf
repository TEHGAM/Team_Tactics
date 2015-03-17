if!(PO3SRV) exitWith {};

private["_return"];

_object = _this select 0;
_requestor = owner (_this select 1);

_return = _object setOwner _requestor;

PO3_brdcst_SRVCLI = [random 99,_return]; _requestor publicVariableClient "PO3_brdcst_SRVCLI";