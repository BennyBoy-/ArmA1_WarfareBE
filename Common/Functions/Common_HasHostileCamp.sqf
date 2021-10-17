//Last modified 12/13/7
//Returns true if any enemy camps exist in passed town.
Private["_camp","_camps","_count","_hostile","_side","_sideID","_town"];

ScopeName "hasHostileCamp";

_town = _this Select 0;
_side = _this Select 1;

_sideID = _side Call GetSideID;
_hostile = false;
_camps = Call Compile Format["%1Camps",Str _town];

for [{_count = Count _camps - 1},{_count >= 0},{_count = _count - 1}] do
{
	_camp = _camps Select _count;

	if (Call Compile Format["%1SideID != _sideID",Str _camp]) then
	{
		_hostile = true;
		BreakTo "hasHostileCamp";
	};
};

_hostile

//12/13/7 MM - Created file.
