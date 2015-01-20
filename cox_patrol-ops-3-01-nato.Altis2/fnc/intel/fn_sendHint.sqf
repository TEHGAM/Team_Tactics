/*
	Author: Eightysix

	Description:
	Create Hint : Global Broadcast
*/
PO3_brdcst_hint = _this; publicVariable "PO3_brdcst_hint";

if(PO3CLI) then {
	_this call PO3_fnc_hint;
};