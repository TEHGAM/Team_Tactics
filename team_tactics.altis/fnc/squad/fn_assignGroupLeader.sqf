/*
	Author: Eightysix

	Description:
	Create Lightning Strike : Global Broadcast
*/
private["_group"];
PO3_pVAR_changeGroupLeader = _this; publicVariable "PO3_pVAR_changeGroupLeader";
if(PO3CLI) then {
	_this call PO3_fnc_setAsLeader;
};