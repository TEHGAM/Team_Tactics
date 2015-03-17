/*
	PO3 Function - PO3_action_setBusy

	Sets BOOLEAN of player action status. Used to prevent player from performing additional tasks whilst occupied.

	Written By: Eightysix

	Params:
	0 - State of player action (True = Busy, False = Not Busy)

	Returns:
	NIL
*/

if(typeName _this != "BOOL") exitWith { ["Incorrect Parameter for Busy Action"] call PO3_fnc_hint };

PO3_playerIsBusy = _this;

if(PO3_playerIsBusy) then {
	if( !isNil "PO3_playerBusy_loop") then { terminate PO3_playerBusy_loop };

	PO3_playerBusy_loop = [] spawn {
		waitUntil {sleep 0.2; !alive player || !PO3_playerIsBusy };
		PO3_playerIsBusy = false;
	};
};

if(!PO3_playerIsBusy) then {
	if( !isNil "PO3_playerBusy_loop") then { terminate PO3_playerBusy_loop };

	PO3_playerBusy_loop = nil;
};