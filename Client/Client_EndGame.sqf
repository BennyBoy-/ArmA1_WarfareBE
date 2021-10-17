_side = _this Select 0;
_sideName = Localize "STRWFEAST";
if (_side == West) then {_sideName = Localize "STRWFWEST"};
[_sideName] Exec "Client\GUI\GUI_EndOfGameStats.sqs";
PlayMusic ["ATrack10",0];
_base = WestBase;
if (_side == West) then {_base = EastBase};
_position = GetPos _base;

_camera = "camera" CamCreate _position;
_camera CamSetDir 0;
_camera CamSetFOV 1;
_camera cameraEffect["Internal","TOP"];
_camera camSetTarget GetPos _base;
_camera CamSetPos [_position Select 0,(_position Select 1) + 2,15];
_camera CamCommit 0;

waitUntil {CamCommitted _camera};

_camera CamSetPos [_position Select 0,(_position Select 1) + 2,45];
_camera camCommit 5;

waitUntil {CamCommitted _camera};

sleep 45;
"1" ObjStatus "DONE";
gameOver = true;
ForceEnd;