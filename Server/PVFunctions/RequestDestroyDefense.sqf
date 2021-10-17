//Last modified 4/16/8
//Request destroyed defense effects to be displayed on all clients.
Private["_client","_direction","_script","_side","_type","_x","_y"];

_side = _this Select 0;
_client = _this Select 1;
_defense = _this Select 2;

[CMDSHOWDEFENSEDESTROYED,_defense] Exec "Server\Server_CommandToClients.sqs";

//4/16/8 MM - Created file.
