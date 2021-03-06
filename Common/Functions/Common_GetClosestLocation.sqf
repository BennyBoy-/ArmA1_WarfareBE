//Last modified 12/17/7
//Returns nearest location to object.

Private["_count","_location","_object","_nearest","_nearestDistance"];
ScopeName "getClosestLocation";

_object = _this Select 0;

_nearest = ObjNull;
_nearestDistance = 100000;

for [{_count = Count locations - 1},{_count >= 0},{_count = _count - 1}] do
{
	_location = locations Select _count;
	_distance = _location Distance _object;

	//Exit early if possible.
	if (_distance < 100) then {_nearest = _location;BreakTo "getClosestLocation"};
	if (_distance < _nearestDistance) then {_nearest = _location;_nearestDistance = _distance};
};

_nearest

//12/15/7 MM - Created file.
