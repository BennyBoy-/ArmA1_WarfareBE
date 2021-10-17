//Last modified 2/6/8
//Returns a list of adjacent locations not belonging to passed side.

Private["_count","_hostileLocations","_side","_sideID"];

_side = _this Select 0;
_sideID = _side Call GetSideID;

_hostileLocations = [];

for [{_count = Count locations - 1},{_count >= 0},{_count = _count - 1}] do
{
	if (Call Compile Format["%1SideID != _sideID",Str (locations Select _count)]) then
	{
		_hostileLocations = _hostileLocations + [locations Select _count];
	};
};

_hostileLocations

//2/6/8 MM - Created file.
