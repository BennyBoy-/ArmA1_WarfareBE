//Last modified 12/11/7
//*****************************************************************************************
//Description: Create markers for player waypoints.
//*****************************************************************************************
Private["_count","_marker","_total","_type","_WP","_WPs"];

_WPs = _this Select 0;

_type = "Marker";
if (Count _this > 1) then {_type = _this Select 1};

_total = Count _WPs;

for [{_count = 0},{_count < _total},{_count = _count + 1}] do 
{
	_WP = _WPs Select _count;

	_marker = Format["PlayerWPMarker%1",_count];
	CreateMarkerLocal [_marker,WaypointPosition _WP];
	_marker SetMarkerTypeLocal _type;
	_marker SetMarkerColorLocal "ColorYellow";
};

//*****************************************************************************************
//12/11/7 MM - Created file.
