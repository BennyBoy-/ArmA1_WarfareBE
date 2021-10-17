//Last modified 5/29/7
//Description:  Client notifies server that structure is in use.
Private["_client","_side","_structure","_time"];

_side = _this Select 0;
_client = _this Select 1;
_structure = _this Select 2;
_time = _this Select 3;

[_structure,_time] ExecVM "Common\Common_StructureInUse.sqf";

//Lock the structure until it is free again.
[_side,CMDSTRUCTUREINUSE,_structure,_time] Exec "Server\Server_CommandToSide.sqs";

//3/30/7 MM - Created file.
