//Last modified 12/7/7
//Description:  returns list of current commander votes for passed side.
Private["_count","_side","_teams","_total","_vote","_votes"];

_side = _this Select 0;

_teams = Call Compile Format["%1Teams",Str _side];
_total = Count _teams + 1;

_votes = [];
for [{_count = 0},{_count < _total},{_count = _count + 1}] do {_votes = _votes + [0]};

//Count votes.
for [{_count = 1},{_count < _total},{_count = _count + 1}] do
{
	if (IsPlayer Leader (_teams Select (_count - 1))) then
	{
		_vote = Call Compile Format["%1Team%2Vote",Str _side,_count] + 1;
		_votes Set[_vote,(_votes Select _vote) + 1];
	}
};

_votes

//7/9/7 MM - Created file.
