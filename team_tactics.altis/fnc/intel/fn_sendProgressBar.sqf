/*
	Author: Eightysix

	Description:
	Create Chat Command : Global Broadcast
*/
PO3_brdcst_progressBar = _this; publicVariable "PO3_brdcst_progressBar";

if(PO3CLI) then {
	_this call PO3_fnc_progressbar;
};