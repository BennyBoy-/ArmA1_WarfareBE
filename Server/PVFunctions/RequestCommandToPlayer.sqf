//Last modified 3/15/8
//Request to issue an order to a player.
Private["_client","_clientCommand","_clientTo","_locked","_side","_vehicle","_x","_y"];

_side = _this Select 0;
_client = _this Select 1;
_clientCommand = _this Select 2;
_x = _this Select 3;
_y = _this Select 4;

_clientTo = 0;
if (_clientCommand >= PLAYERMISSIONPATROL) then {_clientTo = _clientCommand - PLAYERMISSIONPATROL;_clientCommand = 4};
if (_clientCommand >= PLAYERMISSIONDEFENDBASE) then {_clientTo = _clientCommand - PLAYERMISSIONDEFENDBASE;_clientCommand = 3};
if (_clientCommand >= PLAYERMISSIONCAPTURELOCATIONS) then {_clientTo = _clientCommand - PLAYERMISSIONCAPTURELOCATIONS;_clientCommand = 2};
if (_clientCommand >= PLAYERMISSIONMOVE) then {_clientTo = _clientCommand - PLAYERMISSIONMOVE;_clientCommand = 1};

[_side,_clientTo,CMDCOMMANDTOPLAYER,_clientCommand,_x,_y] Exec "Server\Server_CommandToClient.sqs";

//3/14/8 MM - Created file.
