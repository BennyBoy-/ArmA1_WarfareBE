//Last modified 1/27/8
//Returns array of undestroyed units only.
Private["_undestroyedUnits","_units"];

_units = _this;
_undestroyedUnits = [];

{if (GetDammage _x < 1) then {_undestroyedUnits = _undestroyedUnits + [_x]};} ForEach _units;
_undestroyedUnits

//1/27/8 MM - Created file.
