//Last modified 3/15/8
//Commander order to player.
Private["_command","_commandText","_count","_x","_y","_WP","_WPName"];

_command = _this Select 0;
_x = _this Select 1;
_y = _this Select 2;

_commandText = "move to new position.";
_WPName = Localize "STRWFMOVE";

if (_command == 2) then
{
	_commandText = "capture nearest town.";
	_WPName = Localize "STRWFCAPTURE";
};

if (_command == 3) then
{
	_commandText = "defend the base.";
};

if (_command == 4) then
{
	_commandText = "patrol area.";
};

Format["Commander has requested you %1. Waypoint has been set.",_commandText] Call GroupChatMessage;

//Clear any old WPs.
for [{_count = Count Waypoints player},{_count >= 0},{_count = _count - 1}] do {DeleteWaypoint[Group player,_count]};

_WP = [Group player,[_x,_y],0,"move","full","aware",_WPName] Call CreateWP;
_WP SetWaypointStatements ["true","Call CommandToPlayerWPComplete"];
totalPlayerWPs = 1;

_teamName = Format["%1Team%2",sideJoinedText,clientID];
Call Compile Format["%1MissionX = _x;%1MissionY = _y",_teamName];
Call Compile Format["PublicVariable ""%1MissionX"";PublicVariable ""%1MissionY""",_teamName];
Call Compile Format["%1Mission = _command;PublicVariable ""%1Mission""",_teamName];

//3/14/8 MM - Created file.
