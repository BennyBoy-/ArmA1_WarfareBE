//Last modified 1/8/8
//*****************************************************************************************
//Description: Get team's funds.
//*****************************************************************************************
Private["_index","_team","_type"];

_team = _this;

_index = Call Compile Format["%1Teams Find _team",Str Side _team];

//Only get defense teams funds if on the server.
if (_index < 0 && !IsServer) ExitWith {0};

//If not in a regular team then check the defense teams.
if (_index < 0) then
{
	_index = Call Compile Format["%1DefenseTeams Find _team",Str Side _team];

	//Index for defense teams starts at the end of regular teams.
	if (_index >= 0) then
	{
		_index = _index + Call Compile Format["Count %1Teams",Str Side _team];
	};
};

if (_index < 0) ExitWith {0};

_type = "Player";
if (!IsPlayer Leader _team) then {_type = "AI"};

Call Compile Format["%1%2%3Funds",Str (Side Leader _team),_type,_index + 1]

//*****************************************************************************************
//4/20/7 MM - Created file.
