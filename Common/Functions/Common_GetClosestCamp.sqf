//Last modified 10/26/7
//Gets nearest attacker camp site to passed town.
Private["_camp","_camps","_count","_distance","_nearest","_nearestDistance","_position","_town","_x","_y"];

_town = _this Select 0;
_position = _this Select 1;

_nearest = ObjNull;
_nearestDistance = 10000;
_camps = Call Compile Format["%1Camps",Str _town];

for [{_count = Count _camps - 1},{_count >= 0},{_count = _count - 1}] do
{
	_camp = _camps Select _count;

	_x = (_position Select 0) - (GetPos _camp Select 0);
	_y = (_position Select 1) - (GetPos _camp Select 1);
	_distance = sqrt (_x * _x + _y * _y);

	if (_distance < _nearestDistance) then
	{
		_nearest = _camp;
		_nearestDistance = _distance;
	};
};

_nearest

//10/26/7 MM - Created file.
