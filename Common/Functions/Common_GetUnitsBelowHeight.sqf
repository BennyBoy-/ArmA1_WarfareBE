//Last modified 2/5/8
//Returns array of units below passed height.

Private["_belowUnits","_height","_units"];

_units = _this Select 0;
_height = _this Select 1;

_belowUnits = [];

{if ((GetPos _x Select 2) < _height) then {_belowUnits = _belowUnits + [_x]};} ForEach _units;

_belowUnits

//2/5/8 MM - Created file.
