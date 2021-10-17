//Last modified 12/22/7
//*****************************************************************************************
//Description: Get team's rank.
//*****************************************************************************************
Private["_index","_team","_type"];

_team = _this;

_index = eastTeams Find _team;
if (_index < 0) then {_index = westTeams Find _team};
if (_index < 0) ExitWith {-1};

_type = "Player";
if (!IsPlayer Leader _team) then {_type = "AI"};

Call Compile Format["%1%2%3Rank",Str (Side Leader _team),_type,_index + 1]

//*****************************************************************************************
//4/20/7 MM - Created file.
