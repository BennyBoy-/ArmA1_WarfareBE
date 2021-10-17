//Last modified 1/4/8
//Returns nearest locations to object within given range.

Private["_count","_location","_object","_nearest","_range"];
ScopeName "getClosestLocation";

_object = _this Select 0;
_range = _this Select 1;

_nearest = [];

for [{_count = Count locations - 1},{_count >= 0},{_count = _count - 1}] do
{
	_location = locations Select _count;

	if (_location Distance _object <= _range) then
	{
		_nearest = _nearest + [_location];
	};
};

_nearest

//1/4/8 MM - Created file.
