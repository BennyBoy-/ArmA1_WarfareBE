//Last modified 12/15/7
//Returns nearest location not belonging to passed side.

Private["_count","_distance","_hostileLocations","_location","_object","_nearest","_nearestDistance","_side","_sideID"];

_object = _this Select 0;
_side = _this Select 1;
_sideID = _side Call GetSideID;
_hostileLocations = [];

for [{_count = Count locations - 1},{_count >= 0},{_count = _count - 1}] do
{
	_location = locations Select _count;

	if (Call Compile Format["%1SideID != _sideID",Str _location]) then
	{
		_hostileLocations = _hostileLocations + [_location];
	};
};

_nearest = ObjNull;
_nearestDistance = 100000;

for [{_count = Count _hostileLocations - 1},{_count >= 0},{_count = _count - 1}] do
{
	_location = _hostileLocations Select _count;
	_distance = _location Distance _object;

	//Exit early if possible.
	//if (_distance < 100) ExitWith {_location};
	if (_distance < _nearestDistance) then {_nearest = _location;_nearestDistance = _distance};
};

_nearest

//8/16/7 MM - Created file.
