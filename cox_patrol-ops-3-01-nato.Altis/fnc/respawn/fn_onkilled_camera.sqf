/*
	Author: Eightysix

	Description:

*/
private["_object","_x","_y","_camera","_time","_pos_1","_pos_2"];

_time = _this select 0;
_object = PO3_player_body;

_pos_1 = position _object;
_pos_1 set [2,2];
_pos_2 = [];
_pos_2 set [0,(_pos_1 select 0) + (25 - random 50)];
_pos_2 set [1,(_pos_1 select 1) + (25 - random 50)];
_pos_2 set [2,25];

BIS_DEBUG_CAM = true;

camUseNVG false;

_camera = "camera" camCreate _pos_1;
_camera camSetTarget _object;
_camera camSetFOV 0.200;
_camera camCommit 0;
_camera cameraEffect ["internal","back"];
showcinemaborder false;

WaitUntil{camCommitted _camera};

_camera camSetPos _pos_2;
_camera camSetFOV 0.900;
_camera camCommit _time;

waituntil{PO3_player_respawned && camCommitted _camera};

BIS_DEBUG_CAM = nil;

player cameraEffect ["terminate","back"];
camDestroy _camera;
