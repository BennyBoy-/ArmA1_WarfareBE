//Last modified 3/2/8
//Description: Updates mission marker animation on map.
//*****************************************************************************************
Private["_direction","_size","_expand","_lastMarker","_marker"];

_direction = 0;
_size = 1.2;
_expand = true;
_marker = "";
_lastMarker = "";

while {!gameOver} do
{
	Sleep 0.05;

	if (playerMissionDescription != Localize "STRWFNONE") then
	{
		_marker = Format["%1Depot",playerMissionLocation];
		_marker SetMarkerSizeLocal [0,0];
		_direction = (_direction + 1) % 360;
		"playerMissionMarker" SetMarkerDirLocal _direction;
		"playerMissionMarker" SetMarkerSizeLocal [_size,_size];

		if (_marker != _lastMarker) then
		{
			_lastMarker SetMarkerSizeLocal [1,1];
			_lastMarker = "";
		};

		_lastMarker = _marker;

		if (_size > 1.4) then {_expand = false};
		if (_size < 1.2) then {_expand = true};
		if (_expand) then {_size = _size + 0.03} else {_size = _size - 0.03};
	}
	else
	{
		if (_marker != "") then
		{
			_marker SetMarkerSizeLocal [1,1];
			_marker = "";
		};

		Sleep 1;
	};
};

//*****************************************************************************************
//2/8/8 MM - Created file.
