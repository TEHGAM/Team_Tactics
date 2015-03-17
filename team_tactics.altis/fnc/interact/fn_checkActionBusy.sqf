/*
	PO3 Function - PO3_action_isBusy

	Returns BOOLEAN of player action status and hints if TRUE

	Written By: Eightysix

	Params:
	None

	Returns:
	BOOLEAN of player state
*/

if(isNil "PO3_playerIsBusy") then { PO3_playerIsBusy = false };

if( PO3_playerIsBusy ) then { [localize "STR_PO3_ACTION_BUSY"] call PO3_fnc_hint };

PO3_playerIsBusy;