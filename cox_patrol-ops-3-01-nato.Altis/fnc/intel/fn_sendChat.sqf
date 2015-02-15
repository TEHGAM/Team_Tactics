/*
	Author: Eightysix

	Description:
	Create Chat Command : Global Broadcast
*/
PO3_brdcst_chat = _this; publicVariable "PO3_brdcst_chat";

if(PO3CLI) then {
	_this call PO3_fnc_chat;
}