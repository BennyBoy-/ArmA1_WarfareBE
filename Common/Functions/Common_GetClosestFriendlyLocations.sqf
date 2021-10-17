//Last modified 1/4/8
//Returns nearest locations belonging to passed side within passed range.

Private["_count","_location","_object","_friendlyLocations","_nearest","_nearestDistance","_range","_side","_sideID"];

_object = _this Select 0;
_side = _this Select 1;
_range = _this Select 2;

_sideID = _side Call GetSideID;
_friendlyLocations = [];

for [{_count = Count locations - 1},{_count >= 0},{_count = _count - 1}] do
{
	_location = locations Select _count;

	if (Call Compile Format["%1SideID == _sideID",Str _location]) then
	{
		_friendlyLocations = _friendlyLocations + [_location];
	};
};

_nearest = [];

for [{_count = Count _friendlyLocations - 1},{_count >= 0},{_count = _count - 1}] do
{
	_location = _friendlyLocations Select _count;

	if (_location Distance _object <= _range) then
	{
		_nearest = _nearest + [_location];
	};
};

_nearest

//3/22/7 MM - Created file.
