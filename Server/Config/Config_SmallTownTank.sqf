_town = _this Select 0;
_townName = _this Select 1;
_nearLocations = _this Select 2;

_range = 450;
if (Count _this > 3) then {_range = _this Select 3};

_t		= ["DefaultTeam"];
_t = _t + ["DefaultTeam"];
_t = _t + ["ATTeam"];
_t = _t + ["ArmoredTeam"];

_probability = 40;

[_town,_townName,_nearLocations,10,50,false,_range,_t,_probability] ExecVM "Common\Init\Init_Location.sqf";