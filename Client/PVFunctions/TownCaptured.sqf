//Last modified 4/1/8
Private ["_award","_location","_locationName","_marker","_name","_newScore","_objective","_range","_sideToValue","_sideValue","_units"];

_location = _this Select 0;
_sideValue = _this Select 1;
_sideToValue = _this Select 2;
_name = Str _location;

//If this isn't the side getting the message then exit now.
if (_sideToValue != sideID) ExitWith {};

_locationName = "";
Call Compile Format["_locationName = %1Name",_name];

_marker = Format["%1CenterMarker",_name];
_marker1 = Format["%1Depot",_name];
_sideName = Localize "STRWFRESISTANCE";

if (_sideValue == WESTID) then {_sideName = Localize "STRWFWEST"};
if (_sideValue == EASTID) then {_sideName = Localize "STRWFEAST"};
if (_sideValue == sideID) then {_marker SetMarkerColorLocal "ColorGreen";_marker1 SetMarkerColorLocal "ColorGreen"} else {_marker SetMarkerColorLocal "ColorRed";_marker1 SetMarkerColorLocal "ColorRed"};
if (_sideValue == RESISTANCEID) then {_marker SetMarkerColorLocal "ColorBlue";_marker1 SetMarkerColorLocal "ColorBlue"};

//Don't make announcements at the game's start (in case town starts out owned by same side).
if (time > 10) then
{
	[Format[Localize "STRWFTOWNCAPTURED",_locationName,_sideName]] Call TitleTextMessage;
};

//Stop capture progress bar.
cutText["","PLAIN"];

if (_sideValue == sideID) then
{
	PlaySound "TownCaptured";

	_objective = false;
	
	if (!IsNull playerMissionLocation) then
	{
		if (playerMissionLocation == _location) then
		{
			_objective = true;
		};
	};

	//If player or owned units were involved in the capture then award.
	_award = false;

	//If player owns team, check for any units within area.
	if ((Leader Group player) == player) then
	{
		_units = Units Group player;
		{if (_x Distance _location < TOWNCAPTURERANGE) then {_award = true};} ForEach _units;
	};

	if (player Distance _location < TOWNCAPTURERANGE || _award) then
	{
		//If part of the player's mission then more points & bounty is earned.
		if (_objective) then
		{
			TOWNCAPTUREMISSIONBOUNTY Call ChangePlayerFunds;
			[CMDREQUESTCHANGESCORE,player,score player + SCOREMISSIONCAPTURETOWN] Exec "Client\Client_CommandToServer.sqs";
			Format[Localize "STRWFTOWNCAPTUREDMISSIONAWARD",_locationName,TOWNCAPTUREMISSIONBOUNTY] Call GroupChatMessage;

			[true] Call PlayerMissionEnded;
		}
		else
		{
			TOWNCAPTUREBOUNTY Call ChangePlayerFunds;
			[CMDREQUESTCHANGESCORE,player,score player + SCORECAPTURETOWN] Exec "Client\Client_CommandToServer.sqs";
			Format[Localize "STRWFTOWNCAPTUREDAWARD",_locationName,TOWNCAPTUREBOUNTY] Call GroupChatMessage;
		};
	}
	else
	{
		_range = Call Compile Format["%1Range * TOWNCAPTUREASSISTRANGEMODIFIER",Str _location];

		if (player Distance _location < _range) then
		{
			//If part of the player's mission then more points & bounty is earned.
			if (_objective) then
			{
				TOWNASSISTCAPTUREMISSIONBOUNTY Call ChangePlayerFunds;
				[CMDREQUESTCHANGESCORE,player,score player + SCOREMISSIONASSISTCAPTURETOWN] Exec "Client\Client_CommandToServer.sqs";
				Format[Localize "STRWFTOWNCAPTUREDASSISTMISSIONAWARD",_locationName,TOWNASSISTCAPTUREMISSIONBOUNTY] Call GroupChatMessage;

				[true] Call PlayerMissionEnded;
			}
			else
			{
				TOWNASSISTCAPTUREBOUNTY Call ChangePlayerFunds;
				[CMDREQUESTCHANGESCORE,player,score player + SCOREASSISTCAPTURETOWN] Exec "Client\Client_CommandToServer.sqs";
				Format[Localize "STRWFTOWNCAPTUREDASSISTAWARD",_locationName,TOWNASSISTCAPTUREBOUNTY] Call GroupChatMessage;
			};
		}
		else
		{
			//If this was the player objective & player did not help in the capture...
			if (_objective) then
			{
				Format[Localize "STRWFMISSIONFAILED",_locationName] Call GroupChatMessage;

				_newScore = score player - (SCORECAPTURETOWN / 2);
				if (_newScore < 0) then {_newScore = 0};

				[CMDREQUESTCHANGESCORE,player,_newScore] Exec "Client\Client_CommandToServer.sqs";
				[false] Call PlayerMissionEnded;
			};
		};
	};
};

//2/7/7 MM - Created file.
