//Last modified 3/27/7
//Returns a position from passed position at a passed direction and distance.

Private["_position","_distance","_direction"];

_position = _this Select 0;
_distance = _this Select 1;
_direction = _this Select 2;

[(_position Select 0)+((sin _direction)*_distance),(_position Select 1)+((cos _direction)*_distance),(_position Select 2)]

//3/27/7 MM - Created file.
