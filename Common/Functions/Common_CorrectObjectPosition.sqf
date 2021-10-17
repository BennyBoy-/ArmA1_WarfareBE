//Last modified 3/20/8
//Checks object's position with passed value & attempts to adjust it.

Private["_count","_object","_objectPosition","_objectX","_objectY","_position","_x","_y"];
ScopeName "PlaceSafe";

_object = _this Select 0;
_position = _this Select 1;

_objectPosition = GetPos _object;
_objectX = _objectPosition Select 0;
_objectY = _objectPosition Select 1;
_x = (_position Select 0) - _objectX;
_y = (_position Select 1) - _objectY;

_it1=0;

if (_x < 0) then
{
	_count = 0;

	while {abs((_position Select 0) - (GetPos _object Select 0)) > 0.2 && _count > -10} do
	{
		_object SetPos [_objectX + _x + _count,_objectY + _y];
		_count = _count - 0.1;
	};
};

if (_x > 0) then
{
	_count = 0;

	while {abs((_position Select 0) - (GetPos _object Select 0)) > 0.2 && _count < 10} do
	{
		_object SetPos [_objectX + _x + _count,_objectY + _y];
		_count = _count + 0.1;
	};
};

_objectX = GetPos _object Select 0;

if (_y < 0) then
{
	_count = 0;

	while {abs((_position Select 1) - (GetPos _object Select 1)) > 0.2 && _count > -10} do
	{
		_object SetPos [_objectX,_objectY + _y + _count];
		_count = _count - 0.1;
	};
};

if (_y > 0) then
{
	_count = 0;

	while {abs((_position Select 1) - (GetPos _object Select 1)) > 0.2 && _count < 10} do
	{
		_object SetPos [_objectX,_objectY + _y + _count];
		_count = _count + 0.1;
	};
};

//3/20/8 MM - Created file.
