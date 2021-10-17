//Last modified 3/16/8
Private ["_award","_camp","_index","_marker","_name","_captureSideID","_objective","_town","_townSideID","_units"];

_town = _this Select 0;
_captureSideID = _this Select 1;
_camp = _this Select 2;

_name = Call Compile Format["%1Name",Str _town];
_townSideID = Call Compile Format["%1SideID",Str _town];
_index = Call Compile Format["%1Camps Find _camp",Str _town];

if (_index != -1) then
{
	_marker = Format["%1Camp%2",Str _town,_index];
	//_camp RemoveAction 0;
	//_camp RemoveAction 1;

	//If side captures camp then notify them, set marker, and add loadouts option.
	if (sideID == _captureSideID) then
	{
		//If player or owned units were involved in the capture then award.
		_award = false;

		//If player owns team, check for any units within area.
		if (Leader Group player == player) then
		{
			_units = Units Group player;
			{if (_x Distance _camp < 2.5) then {_award = true};} ForEach _units;
		};

		if (player Distance _camp < 2.5 || _award) then
		{
			_objective = false;
			
			if (!IsNull playerMissionLocation) then
			{
				if (playerMissionLocation == _town) then
				{
					_objective = true;
				};
			};

			//If part of the player's mission then more points & bounty is earned.
			if (_objective) then
			{
				CAMPCAPTUREMISSIONBOUNTY Call ChangePlayerFunds;
				[CMDREQUESTCHANGESCORE,player,score player + SCOREMISSIONCAPTURECAMP] Exec "Client\Client_CommandToServer.sqs";
				Format[Localize "STRWFCAMPCAPTUREDMISSIONAWARD",_name,CAMPCAPTUREMISSIONBOUNTY] Call GroupChatMessage;
			}
			else
			{
				CAMPCAPTUREBOUNTY Call ChangePlayerFunds;
				[CMDREQUESTCHANGESCORE,player,score player + SCORECAPTURECAMP] Exec "Client\Client_CommandToServer.sqs";
				Format[Localize "STRWFCAMPCAPTUREDAWARD",_name,CAMPCAPTUREBOUNTY] Call GroupChatMessage;
			};
		}
		else
		{
			Format[Localize "STRWFCAMPCAPTURED",_name] Call GroupChatMessage;
		};

		_marker SetMarkerColorLocal "ColorGreen";
		//_camp AddAction[Localize "STRWFLOADOUTS","Client\GUI\GUI_Loadouts.sqs"];
		//_camp AddAction[Localize "STRWFCONSTRUCTION","Client\GUI\GUI_Construction.sqs"];
	}
	//If other side owns the camp's town (or camp) then they get alerted.
	else
	{
		if (_townSideID == sideID || GetMarkerColor _marker == "ColorGreen") then
		{
			Format[Localize "STRWFCAMPCAPTUREDBYENEMY",_name] Call GroupChatMessage;
			_marker SetMarkerColorLocal "ColorRed";
		};
	};
};

//10/24/7 MM - Created file.
