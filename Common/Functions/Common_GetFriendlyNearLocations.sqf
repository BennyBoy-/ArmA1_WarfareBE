//Last modified 10/26/7
//Returns a list of adjacent locations belonging to passed side.
Private["_count","_location","_locations","_friendlyLocations","_side","_sideID"];

_location = _this Select 0;
_side = _this Select 1;
_sideID = _side Call GetSideID;

_friendlyLocations = [];
_locations = Call Compile Format["%1NearLocations",Str _location];

for [{_count = Count _locations - 1},{_count >= 0},{_count = _count - 1}] do
{
	if (Call Compile Format["%1SideID == _sideID",Str (_locations Select _count)]) then
	{
		_friendlyLocations = _friendlyLocations + [_locations Select _count];
	};
};

_friendlyLocations

//5/11/7 MM - Created file.
