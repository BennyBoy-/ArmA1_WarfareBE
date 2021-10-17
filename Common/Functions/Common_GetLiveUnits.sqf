//Last modified 4/18/7
//Returns array of living units only.

Private["_liveUnits","_units"];

_units = _this;
_liveUnits = [];

{if (Alive _x) then {_liveUnits = _liveUnits + [_x]};} ForEach _units;
_liveUnits

//4/18/7 MM - Created file.
