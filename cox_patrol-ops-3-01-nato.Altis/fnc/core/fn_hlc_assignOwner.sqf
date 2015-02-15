/*
	Author: Eightysix

	Description:

	Syntax:

	Example:
*/
if !(isServer) exitWith {};

_hcID	= owner (_this select 0);
_state	= [_this,1,0,[0]] call BIS_fnc_param;

if !(_hcID > 0) exitWith { ["HLC",format["Failed: HLCID %1 is Zero - %2",_hcID,_state,(_this select 0)]] call PO3_fnc_log; };
if(_state < 15) exitWith { ["HLC",format["Failed: HLCID %1 Low FPS %2. Too low to assign any further units",_hcID,_state]] call PO3_fnc_log; };

_playerIDs = [];
{
	_playerIDs set [count _playerIDs, owner _x];
}forEach (playableUnits);
_playerIDs = _playerIDs - [0];

{
	if(owner _x IN [0,1] && !((owner _x) IN _playerIDs) ) then {
		if !(isNull _x) then {
			if( _x setOwner _hcID ) then {
				["HLC",format["Succeeded: HLCID %1, Object: %2 Command: %3 setOwner %1",_hcID,typeOf _x,_x]] call PO3_fnc_log;
			}else{
				["HLC",format["Failed: HLCID %1, Owner %4, Object: %2 Command: %3 setOwner %1",_hcID,typeOf _x,_x,owner _x]] call PO3_fnc_log;
			};
		};
	};
}forEach allUnits;