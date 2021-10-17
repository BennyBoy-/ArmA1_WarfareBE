//Last modified 2/13/7
//Returns true if any team members remain alive.

Private["_team","_alive","_units"];

_alive = false;
_units = Units _this;

{if (Alive _x) then {_alive = true};} ForEach _units;
_alive

//2/13/7 MM - Created file.
