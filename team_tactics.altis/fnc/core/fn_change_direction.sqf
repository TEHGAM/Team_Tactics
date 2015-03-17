PO3_pVAR_directionState = _this; publicVariable "PO3_pVAR_directionState";

if(PO3CLI) then {
	_this call PO3_fnc_setDir;
	sleep 0.1;
};