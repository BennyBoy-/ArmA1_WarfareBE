
Private["_side"];

_side = _this select 0;
[_side,CMDSIDEMESSAGE,MSGMHQKILLED] Exec "Server\Server_CommandToSide.sqs";
