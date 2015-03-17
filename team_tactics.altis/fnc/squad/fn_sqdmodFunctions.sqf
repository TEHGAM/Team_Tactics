#define PO3_BUTTON_ACTIVATE(CTRL) \
	CTRL ctrlSetFade 0; \
	CTRL ctrlEnable true; \
	CTRL ctrlCommit 0.2; \

#define PO3_BUTTON_DEACTIVATE(CTRL) \
	CTRL ctrlEnable false; \
	CTRL ctrlCommit 0; \

PO3_fnc_sqdmod_updateGUI = {
	{ PO3_BUTTON_DEACTIVATE(uinamespace getvariable _x); }forEach ['PO3_hud_squadmod_b01','PO3_hud_squadmod_b02','PO3_hud_squadmod_b03','PO3_hud_squadmod_b04','PO3_hud_squadmod_b05','PO3_hud_squadmod_b06','PO3_hud_squadmod_b07','PO3_hud_squadmod_b08','PO3_hud_squadmod_b09','PO3_hud_squadmod_C01'];

	switch (true) do {
		 case ( [player] call PO3_fnc_isAdministrator ) : { { PO3_BUTTON_ACTIVATE(uinamespace getvariable _x); }forEach ['PO3_hud_squadmod_b01','PO3_hud_squadmod_b02','PO3_hud_squadmod_b03','PO3_hud_squadmod_b04','PO3_hud_squadmod_b05','PO3_hud_squadmod_b06','PO3_hud_squadmod_b07','PO3_hud_squadmod_b08','PO3_hud_squadmod_b09','PO3_hud_squadmod_C01']; };
		 case ( [group player,player] call PO3_fnc_isTeamLeader ) : { { PO3_BUTTON_ACTIVATE(uinamespace getvariable _x); }forEach ['PO3_hud_squadmod_b01','PO3_hud_squadmod_b02','PO3_hud_squadmod_b04','PO3_hud_squadmod_b07','PO3_hud_squadmod_b08','PO3_hud_squadmod_C01']; };
	};

	PO3_sqdmod_VAR_unitList = [];
	{
		if( {isPlayer _X} count (units _x) > 0 || count (units _x) == 0 || [] call PO3_fnc_isAdministrator) then {
			if (side _x == side player) then {
				PO3_sqdmod_VAR_unitList set [count PO3_sqdmod_VAR_unitList, _x];
				{
					PO3_sqdmod_VAR_unitList set [count PO3_sqdmod_VAR_unitList, _x];
				} foreach units _x;
			};
		};
	} forEach allGroups;

	lbClear (uinamespace getvariable 'PO3_hud_squadmod_C01');
	{
		_index= (uinamespace getvariable 'PO3_hud_squadmod_C01') lbadd format["%1",_x select 0];
		(uinamespace getvariable 'PO3_hud_squadmod_C01') lbSetValue [_index,_forEachIndex];
	}forEach PO3_CfgLogistics_UnitLoadouts;

	lbClear (uinamespace getvariable 'PO3_hud_squadmod_lb1');
	lbClear (uinamespace getvariable 'PO3_hud_squadmod_lb2');
	{
		switch (typeName _x) do {
			case "GROUP" : {
				(uinamespace getvariable 'PO3_hud_squadmod_lb1') lbadd (groupID _x);
				_index= (uinamespace getvariable 'PO3_hud_squadmod_lb2') lbadd format["%1 - %2",groupID _x,(name leader _x)];
				(uinamespace getvariable 'PO3_hud_squadmod_lb2') lbSetValue [_index,_forEachIndex];
			};
			case "OBJECT" : {
				_icon = _x call PO3_fnc_hud_getUnitIcon;
				(uinamespace getvariable 'PO3_hud_squadmod_lb1') lbadd format[
					"%1 %2%3%4",
					(name _x),
					switch (_x getVariable["PO3_VAR_roleAttribute","Rifleman"]) do {
						case "Rifleman" : { "-RFL" };
						case "MachineGunner" : { "-MG" };
						case "MissileSpecialist" : { "-AT" };
						case "Support" : { "-SPT" };
						case "Recon" : { "-REC" };
						default { "" };
					},
					if (_x getVariable ["PO3_VAR_DriverLicense",false]) then { "-D" }else{ "" },
					if (_x getVariable ["PO3_VAR_PilotLicense",false]) then { "-P" }else{ "" }
				];
				(uinamespace getvariable 'PO3_hud_squadmod_lb1') lbSetPicture [ (lbSize (uinamespace getvariable 'PO3_hud_squadmod_lb1')) - 1, _icon];
			};
		};
	} foreach PO3_sqdmod_VAR_unitList;
};

PO3_fnc_sqdmod_selectUnit = {
	PO3_sqdmod_VAR_selectedUnit = PO3_sqdmod_VAR_unitList select (_this select 1);

	if(typeName PO3_sqdmod_VAR_selectedUnit == "GROUP") then {
		(uinamespace getvariable 'PO3_hud_squadmod_ed1') ctrlSetText (groupID PO3_sqdmod_VAR_selectedUnit);
		PO3_sqdmod_VAR_selectedGroup = PO3_sqdmod_VAR_selectedUnit;
		PO3_sqdmod_VAR_selectedUnit = objnull;
	}else{
		{
			if( (_x select 0) == (PO3_sqdmod_VAR_selectedUnit getVariable ["PO3_VAR_roleAttribute","Rifleman"]) ) then {
				(uinamespace getvariable 'PO3_hud_squadmod_C01') lbSetCurSel _forEachIndex;
			};
		}forEach PO3_CfgLogistics_UnitLoadouts;
	};

	[] call PO3_fnc_sqdmod_updateGUI;
};

PO3_fnc_sqdmod_selectGroup = {
	PO3_sqdmod_VAR_selectedGroup = PO3_sqdmod_VAR_unitList  select ((_this select 0) lbValue (_this select 1));
	(uinamespace getvariable 'PO3_hud_squadmod_ed1') ctrlSetText (groupID PO3_sqdmod_VAR_selectedGroup);
	[] call PO3_fnc_sqdmod_updateGUI;
};

PO3_fnc_sqdmod_makeLeader = {
	if(typeName PO3_sqdmod_VAR_selectedUnit != "OBJECT") exitWith {};
	if(typeName PO3_sqdmod_VAR_selectedGroup != "GROUP") exitWith {};
	if !([group PO3_sqdmod_VAR_selectedUnit,player] call PO3_fnc_isTeamLeader || [player] call PO3_fnc_isAdministrator) exitWith { [true,"HINTC","You are not authorised to change the team leader"] call PO3_fnc_hint };
	[PO3_sqdmod_VAR_selectedUnit, group PO3_sqdmod_VAR_selectedUnit] call PO3_fnc_assignGroupLeader;
	[] call PO3_fnc_sqdmod_updateGUI;
};

PO3_fnc_sqdmod_joinGroup = {
	if(typeName PO3_sqdmod_VAR_selectedUnit != "OBJECT") exitWith {};
	if(typeName PO3_sqdmod_VAR_selectedGroup != "GROUP") exitWith {};

	[PO3_sqdmod_VAR_selectedUnit, PO3_sqdmod_VAR_selectedGroup] call PO3_fnc_unitJoinGroup;

	[] call PO3_fnc_sqdmod_updateGUI;

	PO3_sqdmod_VAR_selectedUnit = PO3_sqdmod_VAR_unitList select (lbSelection (uinamespace getvariable 'PO3_hud_squadmod_lb1') select 0);
};

PO3_fnc_sqdmod_newGroup = {
	[player] call PO3_fnc_createNewGroup;
	[] call PO3_fnc_sqdmod_updateGUI;
};

PO3_fnc_sqdmod_deleteGroup = {
	if(typeName PO3_sqdmod_VAR_selectedGroup != "GROUP") exitWith {};
	if(count units PO3_sqdmod_VAR_selectedGroup > 0) exitWith { [true,"HINT","Cannot DELETE Group as the Group is Not Empty."] call PO3_fnc_hint };

	deleteGroup PO3_sqdmod_VAR_selectedGroup;
	[] call PO3_fnc_sqdmod_updateGUI;
};

PO3_fnc_sqdmod_editGroup = {
	private["_name"];
	_name = ctrlText (uinamespace getvariable 'PO3_hud_squadmod_ed1');
	[PO3_sqdmod_VAR_selectedGroup,_name] call PO3_fnc_changeGroupID;

	[] call PO3_fnc_sqdmod_updateGUI;
};

PO3_fnc_sqdmod_assignLicense = {
	if( !([player] call PO3_fnc_isAdministrator) && !([group PO3_sqdmod_VAR_selectedUnit,player] call PO3_fnc_isTeamLeader) ) exitWith {
			[true,"HTINTC","You are not authorised to change the team"] call PO3_fnc_hint;
	};

	_license = _this select 0;
	switch (toLower _license) do {
		case "driver" : {
			if !([PO3_sqdmod_VAR_selectedUnit,format["%1",_license]] call PO3_fnc_isQualified) then {
				[PO3_sqdmod_VAR_selectedUnit] call PO3_fnc_setAsCrewman;
				[ [PO3_sqdmod_VAR_selectedUnit], "HINT", format[localize "STR_PO3_DIALOG_ASSIGNROLE","Driver"]] call PO3_fnc_sendHint;
				[ (group PO3_sqdmod_VAR_selectedUnit), "GROUP", format[localize "STR_PO3_DIALOG_ASSIGNEDROLE", name PO3_sqdmod_VAR_selectedUnit,"Driver"] ] call PO3_fnc_sendChat;
			}else{
				PO3_sqdmod_VAR_selectedUnit setVariable ["PO3_VAR_DriverLicense",false,true];
				hint "Unassigned as driver";
			};
		};
		case "pilot" : {
			if !([PO3_sqdmod_VAR_selectedUnit,format["%1",_license]] call PO3_fnc_isQualified) then {
				[PO3_sqdmod_VAR_selectedUnit] call PO3_fnc_setAsPilot;
				[ [PO3_sqdmod_VAR_selectedUnit], "HINT", format[localize "STR_PO3_DIALOG_ASSIGNROLE","Pilot"]] call PO3_fnc_sendHint;
				[ (group PO3_sqdmod_VAR_selectedUnit), "GROUP", format[localize "STR_PO3_DIALOG_ASSIGNEDROLE", name PO3_sqdmod_VAR_selectedUnit,"Pilot"] ] call PO3_fnc_sendChat;
			}else{
				PO3_sqdmod_VAR_selectedUnit setVariable ["PO3_VAR_PilotLicense",false,true];
				hint "Unassigned as pilot";
			};
		};
		default { hint "Noithing"; };
	};
	[] call PO3_fnc_sqdmod_updateGUI;
};

PO3_fnc_sqdmod_assignRole = {
	if( !([player] call PO3_fnc_isAdministrator) && !([group PO3_sqdmod_VAR_selectedUnit,player] call PO3_fnc_isTeamLeader) ) exitWith {
			[true,"HTINTC","You are not authorised to change the team"] call PO3_fnc_hint;
	};

	_role = (PO3_CfgLogistics_UnitLoadouts select (_this select 1)) select 0;

	if !([PO3_sqdmod_VAR_selectedUnit,format["%1",_role]] call PO3_fnc_isQualified) then {
		PO3_sqdmod_VAR_selectedUnit setVariable ["PO3_VAR_roleAttribute",_role,true];
		[ [PO3_sqdmod_VAR_selectedUnit], "HINT", format[localize "STR_PO3_DIALOG_ASSIGNROLE",_role]] call PO3_fnc_sendHint;
		[ (group PO3_sqdmod_VAR_selectedUnit), "GROUP", format[localize "STR_PO3_DIALOG_ASSIGNEDROLE", name PO3_sqdmod_VAR_selectedUnit,_role] ] call PO3_fnc_sendChat;
	};

	[] call PO3_fnc_sqdmod_updateGUI;
};

PO3_fnc_sqdmod_requestUAS = {
	if !(isPlayer PO3_sqdmod_VAR_selectedUnit) exitWith { [true,"HINT","No Assigned Player to send the UAS to"] call PO3_fnc_hint };
	if ( !([group PO3_sqdmod_VAR_selectedUnit,player] call PO3_fnc_isTeamLeader) && !([player] call PO3_fnc_isAdministrator) ) exitWith { [true,"HINTC","You are not authorised!"] call PO3_fnc_hint };

	_type = _this select 0;
	switch (toLower _type) do {
		case "uav" : {
			if !(alive PO3_support_ActiveUAV) then { [PO3_sqdmod_VAR_selectedUnit] spawn PO3_fnc_supportCreateUAV };
		};
		case "ugv" : {
			if !(alive PO3_support_ActiveUGV) then { [PO3_sqdmod_VAR_selectedUnit] spawn PO3_fnc_supportCreateUGV };
		};
	};
	[] call PO3_fnc_sqdmod_updateGUI;
};
