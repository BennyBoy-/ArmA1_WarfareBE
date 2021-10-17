Private["_side","_sideValue"];

_sideValue = _this Select 0;
_side = East;
if (_sideValue == WESTID) then {_side = West};

[_side] ExecVM "Client\Client_EndGame.sqf";
