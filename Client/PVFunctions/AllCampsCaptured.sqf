//Last modified 3/16/8
Private ["_alertOtherSide","_camp","_camps","_count","_marker","_sideID"];

_town = _this Select 0;
_sideID = _this Select 1;
_alertOtherSide = _this Select 2;

_camps = Call Compile Format["%1Camps",Str _town];

for [{_count = Count _camps - 1},{_count >= 0},{_count = _count - 1}] do
{
	_camp = _camps Select _count;
	//_camp RemoveAction 0;
	//_camp RemoveAction 1;
	_marker = Format["%1Camp%2",Str _town,_camps Find _camp];

	//If player is on owning side then get loadouts and marker update.
	if (sideID == _sideID) then
	{
		_marker SetMarkerColorLocal "ColorGreen";
		//_camp AddAction[Localize "STRWFLOADOUTS","Client\GUI\GUI_Loadouts.sqs"];
		//_camp AddAction[Localize "STRWFCONSTRUCTION","Client\GUI\GUI_Construction.sqs"];
	}
	//If player's side previously owned camp (or town) then update the marker.
	else
	{
		if (_alertOtherSide || GetMarkerColor _marker == "ColorGreen") then
		{
			_marker SetMarkerColorLocal "ColorRed";
		};
	};
};

//10/26/7 MM - Created file.
