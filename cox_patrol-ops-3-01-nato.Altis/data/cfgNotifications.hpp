// =========================================================================================================
// !!  DO NOT MODIFY THIS FILE  !!
// =========================================================================================================
// class CfgNotifications {
	class PO3_TaskAssigned {
		title = $STR_PO3_TASK_ASGN;
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		priority = 5;
		sound = "taskAssigned";
	};

	class PO3_TaskCanceled {
		title = $STR_PO3_TASK_CANX;
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_ca.paa";
		color[] = {0.7,0.7,0.7,1};
		description = "%1";
		priority = 5;
		sound = "taskCanceled";
	};

	class PO3_TaskCreated {
		title = $STR_PO3_TASK_CREA;
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_ca.paa";
		description = "%1";
		priority = 1;
		sound = "taskCreated";
	};

	class PO3_TaskFailed {
		title = $STR_PO3_TASK_FAIL;
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
		color[] = {1,0.3,0.2,1};
		description = "%1";
		priority = 2;
		sound = "taskFailed";
	};

	class PO3_TaskSucceeded {
		title = $STR_PO3_TASK_SUCC;
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
		color[] = {0.7,1,0.3,1};
		description = "%1";
		priority = 2;
		sound = "taskSucceeded";
	};

	class PO3_TaskUpdated {
		title = $STR_PO3_TASK_UPDT;
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		priority = 5;
		sound = "taskUpdated";
	};

	class PO3_notify {
		title = "%1";
		description = "%2";
		iconPicture = "%3";
		sound = "taskCreated";
		priority = 2;
	};

	class PO3_notify_blue {
		color[] = {0.66,0.66,1.00,1};
		title = "%1";
		description = "%2";
		iconPicture = "%3";
		sound = "taskCreated";
		priority = 2;
	};

	class PO3_notify_red {
		color[] = {1.00,0.66,0.66,1};
		title = "%1";
		description = "%2";
		iconPicture = "%3";
		sound = "taskCreated";
		priority = 2;
	};

	class PO3_notify_green {
		color[] = {0.66,1.00,0.66,1};
		title = "%1";
		description = "%2";
		iconPicture = "%3";
		sound = "taskCreated";
		priority = 2;
	};

	class PO3_notify_yellow {
		color[] = {1.00,1.00,0.66,1};
		title = "%1";
		description = "%2";
		iconPicture = "%3";
		sound = "taskCreated";
		priority = 2;
	};

	class PO3_notify_white {
		color[] = {1.00,1.00,1.00,1};
		title = "%1";
		description = "%2";
		iconPicture = "%3";
		sound = "taskCreated";
		priority = 2;
	};
// };