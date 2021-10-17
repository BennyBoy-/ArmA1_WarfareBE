//Last modified 1/4/8
//Returns a random position from passed position within passed radius.

Private["_position","_radius","_direction","_maxRadius","_minRadius"];

_position = _this Select 0;
_minRadius = _this Select 1;
_maxRadius = _this Select 2;
_direction = Random 360;

_radius = (Random (_maxRadius - _minRadius)) + _minRadius;
_position = [(_position Select 0)+((sin _direction)*_radius),(_position Select 1)+((cos _direction)*_radius),(_position Select 2)];
_position

//1/31/7 MM - Created file.
