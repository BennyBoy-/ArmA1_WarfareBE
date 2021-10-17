//Last modified 12/13/7
//Returns the distance between two positions.
Private["_length","_position1","_position2","_width"];

_position1 = _this Select 0;
_position2 = _this Select 1;

_length = (_position1 Select 0) - (_position2 Select 0);
_width = (_position1 Select 1) - (_position2 Select 1);

sqrt ((_length ^ 2) + (_width ^ 2))

//12/13/7 MM - Created file.
