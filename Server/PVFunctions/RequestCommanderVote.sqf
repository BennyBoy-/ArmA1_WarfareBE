//Last modified 1/8/8
//Description:  Client requests a new vote for the commander be started.
Private["_commanderTeam","_client","_side","_team"];

_side = _this Select 0;
_client = _this Select 1;

if (Call Compile Format["%1CommanderVoteTime <= 0",Str _side]) then
{
	_team = -1;
	_commanderTeam = Call Compile Format["%1CommanderTeam",Str _side];

	if (!IsNull _commanderTeam) then
	{
		_team = Call Compile Format["%1Teams Find _commanderTeam",Str _side];
	};

	//Set votes to current commander.  Players will have to change their vote if they want a new commander.
	[_side,_team] Call SetCommanderVotes;

	[_side,true] Exec "Server\Server_VoteForCommander.sqs";
	[_side,CMDSIDEMESSAGE,MSGVOTEFORCOMMANDER] Exec "Server\Server_CommandToSide.sqs";
};

//1/8/8 MM - Created file.
