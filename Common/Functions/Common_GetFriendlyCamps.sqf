//Last modified 12/15/7
//Gets nearest friendly camp site to passed town.
Private["_camp","_camps","_count","_friendlyCamps","_side","_sideID","_town"];

_town = _this Select 0;
_side = _this Select 1;

_sideID = _side Call GetSideID;
_camps = Call Compile Format["%1Camps",Str _town];
_friendlyCamps = [];

for [{_count = Count _camps - 1},{_count >= 0},{_count = _count - 1}] do
{
	_camp = _camps Select _count;

	if (Call Compile Format["%1SideID == _sideID",Str _camp]) then
	{
		_friendlyCamps = _friendlyCamps + [_camp];
	};
};

_friendlyCamps

//12/15/7 MM - Created file.
