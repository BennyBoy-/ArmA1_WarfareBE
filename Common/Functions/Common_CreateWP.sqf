//Last modified 8/28/8
//Creates a waypoint.
Private["_team","_position","_radius","_params","_type","_speed","_behavior","_description"];

_team = _this Select 0;
_position = _this Select 1;
_radius = _this Select 2;
_params = Count _this;

_type = "move";
if (_params > 3) then {_type = _this Select 3};

_speed = "full";
if (_params > 4) then {_speed = _this Select 4};

_behavior = "safe";
if (_params > 5) then {_behavior = _this Select 5};

_description = "";
if (_params > 6) then {_description = _this Select 6};

_WP = _team AddWaypoint [_position,_radius];
_WP SetWaypointType _type;
_WP SetWaypointSpeed _speed;
//_WP SetWaypointBehaviour _behaviour;
_WP SetWaypointDescription _description;
_WP ShowWaypoint "always";

_WP

//2/25/7 MM - Created file.
