//Last modified 3/11/8
//*****************************************************************************************
//Description: Queues a unit for purchase.
//*****************************************************************************************
Private["_type","_unitType","_factory","_empty","_team"];

_type = _this Select 0;
_unitType = _this Select 1;
_factory = _this Select 2;
_empty = _this Select 3;

_team = Group player;
if (Count _this > 4) then {_team = _this Select 4};

buildQueueFactory = buildQueueFactory + [_factory];
buildQueue = buildQueue + [_unitType];
buildQueueFactoryType = buildQueueFactoryType + [_type];
buildQueueEmpty = buildQueueEmpty + [_empty];
buildQueueTeam = buildQueueTeam + [_team];

//*****************************************************************************************
//3/11/8 MM - Created file.
