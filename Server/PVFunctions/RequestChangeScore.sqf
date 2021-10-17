//Last modified 4/16/8
//Change a player's score for all players.
Private["_client","_newScore","_playerChanged","_side"];

_side = _this Select 0;
_client = _this Select 1;
_playerChanged = _this Select 2;
_newScore = _this Select 3;

_oldScore = Score _playerChanged;
_playerChanged AddScore -_oldScore;
_playerChanged AddScore _newScore;

[CMDCHANGESCORE,_playerChanged,_newScore] Exec "Server\Server_CommandToClients.sqs";

//12/18/7 MM - Created file.
