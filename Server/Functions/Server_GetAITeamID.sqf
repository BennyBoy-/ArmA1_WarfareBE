//Last modified 11/7/7
//*****************************************************************************************
//Description: Get AI team's ID.
//*****************************************************************************************
Private["_index","_team","_type"];

_team = _this;

_index = Call Compile Format["%1Teams Find _team",Str Side _team];

//If not in a regular team then check the defense teams.
if (_index < 0) then
{
	_index = Call Compile Format["%1DefenseTeams Find _team",Str Side _team];

	if (_index >= 0) then
	{
		_index = _index + Call Compile Format["Count %1Teams",Str Side _team];
	};
};

_index + 1

//*****************************************************************************************
//11/7/7 MM - Created file.
