//Last modified 8/22/7
Private["_client","_side","_team"];

_side = _this Select 0;
_client = _this Select 1;

//Notify client that game has begun.
[_side,_client,CMDINITGAME,eastCommanderVoteTime,westCommanderVoteTime] Exec "Server\Server_CommandToClient.sqs";

//Send any data to the client.
[_side,_client] Exec "Server\Server_SendNewClientData.sqs";

_team = [_side,_client] Call GetClientTeam;
if (_side == West) then {westAITeams = westAITeams - [_team]} else {eastAITeams = eastAITeams - [_team]};
