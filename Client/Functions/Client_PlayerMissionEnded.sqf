//Last modified 3/16/8
//Player mission has succeeded or failed.
Private["_success"];

_success = _this Select 0;

playerMissionLocation = ObjNull;
playerMissionLocationName = "";
playerMissionDescription = Localize "STRWFNONE";

if (Count playerMissionWP > 0) then
{
	DeleteWaypoint playerMissionWP;
	playerMissionWP = [];
};

DeleteMarkerLocal "playerMissionMarker";
DeleteMarkerLocal "playerMissionAreaMarker";
DeleteMarkerLocal "playerObjectiveMarker";

if (_success) then
{
	missionsCompleted = missionsCompleted + 1;
	Call Compile Format["%1Player%2MissionsCompleted = missionsCompleted;PublicVariable ""%1Player%2MissionsCompleted""",sideJoinedText,clientID];
}
else
{
	//Only count it as a failure if the mission has been engaged for a while.
	//This gives players a chance to cancel mission if accidentally selected.
	if (time - playerMissionStartTime > 30) then {missionsFailed = missionsFailed + 1};
	Call Compile Format["%1Player%2MissionsFailed = missionsFailed;PublicVariable ""%1Player%2MissionsFailed""",sideJoinedText,clientID];
};

Format[Localize "STRWFGETNEWMISSIONHELP",ActionKeysNames["TeamSwitch",1]] Call GroupChatMessage;

//12/11/7 MM - Created file.
