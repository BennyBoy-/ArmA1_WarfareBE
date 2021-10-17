// Send server to clients command to start nuke atack, also start the atack on server

_cmd1 = _this select 0; // west (side)
_cmd2 = _this select 1; // 1 ?
_cmd3 = _this select 2; // PARAMETER WestSlot1 f.e.

[_cmd3] exec "Client\Support\Nuke\nuke_exp.sqs";

[CMDSTARTNUKE,_cmd1,_cmd2,_cmd3] Exec "Server\Server_CommandToClients.sqs";