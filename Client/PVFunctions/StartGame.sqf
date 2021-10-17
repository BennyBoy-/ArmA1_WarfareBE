//Last modified 3/2/8
Private["_commanderTeam","_text"];

_commanderTeam = _this Select 0;

//Localize "STRWFGAMESTARTED" Call SideChatMessage;

gameStarted = true;

_text = Localize "STRWFAICONTROLLEDCOMMANDER";

if (!IsNull _commanderTeam) then
{
	_text = Format[Localize "STRWFISTHECOMMANDER",Name Leader _commanderTeam];

	//If player is the commander then don't announce to this player.
	if (Group player == _commanderTeam) then {_text = ""};
};

if (_text != "") then {[_text] Call TitleTextMessage};

