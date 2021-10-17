//Last modified 12/22/7
//*****************************************************************************************
//Description: Get team's funds.
//*****************************************************************************************
Private["_index","_team"];

_team = _this;
if (!IsPlayer Leader _team) ExitWith {0};

_index = Call Compile Format["%1Teams Find _team",Str Side _team];
if (_index < 0) ExitWith {0};

Call Compile Format["%1Player%2Points",Str (Side Leader _team),+ 1]

//*****************************************************************************************
//12/22/7 MM - Created file.
