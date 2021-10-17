//Last modified 3/27/8
Private["_direction","_marker","_structure","_type"];

_structure = _this Select 0;
_type = _this Select 1;
_direction = _this Select 2;

_structure SetDir _direction;

if (IsNil "gameInitialized") then {gameInitialized = false};
WaitUntil {gameInitialized};

if (Local player) then
{
	if (Call Compile Format["TypeOf _structure In %1StructureNames",sideJoinedText]) then
	{
		baseStructures = baseStructures + [_structure];

		//Do not display construction message for JIP.
		if (time - timeConnected > 5) then
		{
			Format[Localize "STRWFSTRUCTURECONSTRUCTED",Call Compile Format ["%1StructureDescriptions Select _type",sideJoinedText]] Call GroupChatMessage;
//			PlaySound Format["%1Constructed%2",Call Compile Format ["%1Structures Select _type",sideJoinedText],commanderVoice];
		};

		_marker = Format["BaseMarker%1",Count baseStructures];
		CreateMarkerLocal [_marker,GetPos _structure];
		_marker SetMarkerTypeLocal "Dot";
		_marker SetMarkerTextLocal ([_structure] Call GetStructureMarkerLabel);
		_marker SetMarkerColorLocal "ColorBlue";

		if (MarkerText _marker == "") then {_marker SetMarkerTypeLocal "Empty"};
	};
};

//3/26/7 MM - Created file.
