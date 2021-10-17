//Last modified 3/30/8
//Returns nearest locations to object within given range.

Private["_count","_location","_object","_nearest","_range","_side","_sideID"];
ScopeName "getClosestLocation";

_object = _this Select 0;
_side = _this Select 1;
_range = _this Select 2;
_sideID = _side Call GetSideID;

_nearest = [];

for [{_count = Count locations - 1},{_count >= 0},{_count = _count - 1}] do
{
	_location = locations Select _count;

	if (Call Compile Format["%1SideID != _sideID",Str _location]) then
	{
		if (_location Distance _object <= _range) then
		{
			_nearest = _nearest + [_location];
		};
	};
};

_nearest

//3/30/8 MM - Created file.
