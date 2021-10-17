//Last modified 5/16/8
Private ["_camp","_campSideID","_camps","_count","_count1","_marker","_town","_townSideID"];

for [{_count = Count towns - 1},{_count >= 0},{_count = _count - 1}] do
{
	_town = towns Select _count;
	_townSideID = Call Compile Format["%1SideID",Str _town];

	if (sideID == _townSideID) then
	{
		_marker = Format["%1CenterMarker",Str _town];
		_marker SetMarkerTypeLocal "Town";
		_marker SetMarkerColorLocal "ColorGreen";

		_marker = Format["%1Depot",Str _town];
		_marker SetMarkerColorLocal "ColorGreen";
	};

	_camps = Call Compile Format["%1Camps",Str _town];

	for [{_count1 = Count _camps - 1},{_count1 >= 0},{_count1 = _count1 - 1}] do
	{
		_camp = _camps Select _count1;
		_camp RemoveAction 0;
		_camp RemoveAction 1;
		_marker = Format["%1Camp%2",Str _town,_camps Find _camp];
		_campSideID = Call Compile Format["%1SideID",Str _camp];

		//If player is on owning side then get loadouts and marker update.
		if (sideID == _campSideID) then
		{
			_marker SetMarkerColorLocal "ColorGreen";
			//_camp AddAction[Localize "STRWFLOADOUTS","Client\GUI\GUI_Loadouts.sqs"];
			//_camp AddAction[Localize "STRWFCONSTRUCTION","Client\GUI\GUI_Construction.sqs"];
		}
		//If player's side previously owned camp (or town) then update the marker.
		else
		{
			if (_townSideID == sideID) then
			{
				_marker SetMarkerColorLocal "ColorRed";
			};
		};
	};
};

//11/29/7 MM - Created file.
