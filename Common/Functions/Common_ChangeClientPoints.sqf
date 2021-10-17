//Last modified 12/23/7
//*****************************************************************************************
//Description: Changes the player's funds by passed amount.
//*****************************************************************************************
Private["_amount","_ID","_leader","_points","_score","_side"];

_amount = _this Select 0;
_side = _this Select 1;
_ID = _this Select 2;

_points = 0;

Call Compile Format["%1Player%2Points = %1Player%2Points + _amount;_points = %1Player%2Points;",Str _side,_ID];

if (abs _points >= 1.0) then
{
	_leader = Leader ([_side,_ID] Call GetClientTeam);
	_score = _points - (_points % 1);
	_points = _points - _score;

	Call Compile Format["%1Player%2Points = _points",Str _side,_ID];

	if (IsServer) then
	{
		[0,0,_leader,Score _leader + _score] Call SRVFNCRequestChangeScore;
	}
	else
	{
		[CMDREQUESTCHANGESCORE,_leader,Score _leader + _score] Exec "Client\Client_CommandToServer.sqs";
	};
};

Call Compile Format["PublicVariable ""%1Player%2Points"";",Str _side,_ID];

//*****************************************************************************************
//3/15/7 MM - Created file.
