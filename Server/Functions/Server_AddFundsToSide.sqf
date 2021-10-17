//Last modified 5/5/7
//*****************************************************************************************
//Description: Adds funds to all player & AI teams on a side.
//[Side,Amount] Call AddFundsToSide
//*****************************************************************************************
Private["_AITeams","_count","_funds","_side","_team","_teams","_total"];

_side = _this Select 0;
_funds = _this Select 1;

_teams = Call Compile Format["%1Teams",Str _side];
_AITeams = Call Compile Format["%1AITeams",Str _side];
_total = Count _teams;

//Check each team & determine if funds need to be added a player or AI.
for [{_count = 0},{_count < _total},{_count = _count + 1}] do
{
	_team = _teams Select _count;

	if (_team In _AITeams) then
	{
		[_funds,_side,_count + 1] Call ChangeAIFunds;
	}
	else
	{
		[_funds,_side,_count + 1] Call ChangeClientFunds;
	};
};

//*****************************************************************************************
//5/5/7 MM - Created file.
