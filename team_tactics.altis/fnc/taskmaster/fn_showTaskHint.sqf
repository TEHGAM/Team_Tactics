/*
	Author: Shuko
	Modified: Eightysix

	Description:
		Displays the task update hint

	Syntax:
		Not to be called directly

	Example:
		Not to be called directly
*/

private "_state";
if( PO3_a3 ) then {
	_state = switch (tolower (_this select 1)) do {
		case "created" :	{ "PO3_TaskCreated" };
		case "current" :	{ "PO3_TaskUpdated" };
		case "assigned" :	{ "PO3_TaskAssigned" };
		case "succeeded" :	{ "PO3_TaskSucceeded" };
		case "failed" :		{ "PO3_TaskFailed" };
		case "canceled" :	{ "PO3_TaskCanceled" };
		case "updated" :	{ "PO3_TaskUpdated" };
	};
	[_state,[format ["%1",((taskDescription (_this select 0)) select 1)] ]] call bis_fnc_showNotification;
}else{
	_state = switch (tolower (_this select 1)) do {
		case "created": { [localize "str_taskNew", [1,1,1,1], "taskNew"] };
		case "current": { [localize "str_taskSetCurrent", [1,1,1,1], "taskCurrent"] };
		case "assigned": { [localize "str_taskSetCurrent", [1,1,1,1], "taskCurrent"] };
		case "succeeded": { [localize "str_taskAccomplished", [0.600000,0.839215,0.466666,1.000000], "taskDone"] };
		case "failed": { [localize "str_taskFailed", [0.972549,0.121568,0.000000,1.000000], "taskFailed"] };
		case "canceled": { [localize "str_taskCancelled", [0.750000,0.750000,0.750000,1.000000], "taskFailed"] };
	};
	taskHint [format [(_state select 0) + "\n%1", ((taskDescription (_this select 0)) select 1)], (_state select 1), (_state select 2)];
};