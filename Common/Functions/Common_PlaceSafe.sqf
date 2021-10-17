//Last modified 3/29/8
//Attempt to place the object where there is not an obstacle.

Private["_count","_currentPosition","_direction","_object","_obstacles","_placed","_position","_radius","_vehicles"];
ScopeName "PlaceSafe";

_object = _this Select 0;
_position = _this Select 1;

_radius = 25;
if (Count _this > 2) then {_radius = _this Select 2};

_currentPosition = _position;
_placed = false;
_direction = 0;

for [{_count = 0},{_count < 10 && !_placed},{_count = _count + 1}] do
{
	_obstacles = _currentPosition NearObjects ["Building",15];
	_vehicles = NearestObjects [_currentPosition,["Building","Car","Tank","Air"],6];

	if (Count _obstacles > 0 || Count _vehicles > 0 || SurfaceIsWater _currentPosition) then
	{
		_currentPosition = [(_position Select 0)+((sin _direction)*_radius),(_position Select 1)+((cos _direction)*_radius),0];
		_direction = _direction + 36;
	}
	else
	{
		_object SetPos _currentPosition;
		_placed = true;
		BreakTo "PlaceSafe";
	};
};

//Unable to find a safe location so just place the object.
if (!_placed) then {_object SetPos _position};

//1/12/8 MM - Created file.
