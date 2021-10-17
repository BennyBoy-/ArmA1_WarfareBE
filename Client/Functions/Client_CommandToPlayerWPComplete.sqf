//Last modified 3/15/8
//Called when player moved to WP created by a commander order.
Private["_name"];

_name = Format["%1Team%2",sideJoinedText,clientID];
Call Compile Format["%1Mission = 0;PublicVariable ""%1Mission""",_name];
Call Compile Format["%1MissionX = -1;PublicVariable ""%1MissionX""",_name];
Call Compile Format["%1MissionY = -1;PublicVariable ""%1MissionY""",_name];

//3/15/8 MM - Created file.
