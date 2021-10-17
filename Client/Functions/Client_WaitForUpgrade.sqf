_time = _this Select 0;
_count = _this Select 1;
_side = _this Select 2;
_green = [0,1,0.24,0.85];
inUse = true;

ctrlSetText [665005,Format ["Upgrade In Progress : %1",(upgradeLabel select _count)]];
_totaltime = _time;
while {_time > 0}do{
sleep 1;
_time = _time - 1;
_timer = format ["%1s",_time];
ctrlSetText [665005,Format ["Upgrade In Progress : %1 %2",(upgradeLabel select UpgradeIPG),_timer]];
};

inUse = false;
if (_side == WEST) then {upgradeVerify set [_count,true];publicVariable "upgradeVerify";} else {upgradeVerifyEast set [_count,true];publicVariable "upgradeVerifyEast";};
lbSetColor [665001,_count, _green];
ctrlSetText [665005, "Upgrade In Progress : N/A"];
switch (_count) do {case 0: {[sideJoined,CMDSIDEMESSAGE,MSGSATELLITEUPGRADED] Exec "Server\Server_CommandToSide.sqs";}; case 1: {[sideJoined,CMDSIDEMESSAGE,MSGUNITSCAMUPGRADED] Exec "Server\Server_CommandToSide.sqs";}; case 2: {[sideJoined,CMDSIDEMESSAGE,MSGWAFUPGRADED] Exec "Server\Server_CommandToSide.sqs";}; case 3: {[sideJoined,CMDSIDEMESSAGE,MSGAFUPGRADED] Exec "Server\Server_CommandToSide.sqs";}; case 4: {[sideJoined,CMDSIDEMESSAGE,MSGARTYUPGRADED] Exec "Server\Server_CommandToSide.sqs";}; case 5: {[sideJoined,CMDSIDEMESSAGE,MSGHVFUPGRADED] Exec "Server\Server_CommandToSide.sqs";}; case 6: {[sideJoined,CMDSIDEMESSAGE,MSGLVFUPGRADED] Exec "Server\Server_CommandToSide.sqs";}; case 7: {[sideJoined,CMDSIDEMESSAGE,MSGRAXUPGRADED] Exec "Server\Server_CommandToSide.sqs";};};