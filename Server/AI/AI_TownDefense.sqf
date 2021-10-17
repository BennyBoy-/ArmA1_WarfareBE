Private["_camps","_center","_count","_defense","_defenses","_defensesOnly","_deactivationTime","_detectionRange","_enemies","_leader","_leaderType","_livingUnits","_location","_name","_objects","_opposingSide","_patrolRange","_position","_randomDefenses","_side","_soldierType","_team","_timeInactive","_total","_unit","_unitName","_unitTypes","_vehicles","_x"];
ScopeName "UpdateTownDefense";

_location = _this Select 0;
_name = Str _location;
_side = _this Select 2;
_unitTypes = _this Select 3;
_deactivationTime = _this Select 4;
_pos = GetMarkerPos Format["%1CenterMarker",_name];
_detectionRange = Call Compile Format["%1Range",_name];
_radius = _detectionRange * DETECTIONTOPATROLRANGERATIO;
_defensesOnly = false;
_defensesOnly = _this select 6;
if (_defensesOnly) exitwith {};

_opposingSide = East;
_soldierType = WaaSOLDIER;
if (_side == East) then {_opposingSide = West;_soldierType = EaaSOLDIER};
_leaderType = _unitTypes Select 0;
_guard  = creategroup _side;
_leaderType createUnit [_pos, _guard,"", 1 ,"SERGEANT"];
_leader = units _guard select 0;
_leader SetSkill 0.5;
[_leader,_pos,50] Call PlaceSafe;
_position = GetPos _leader;
[_leader,_side] Call InitUnit;
_x = 8;
_unit = _leader;
while {_x > 0}do{
_soldierType createUnit [_pos, _guard,"", 1 ,"private"];
_unit = units _guard select (count units _guard - 1);
_unit SetSkill 0.4;
[_unit,_side] Call InitUnit;
sleep 0.5;
_x = _x - 1;
};

//////////////////////////////////////////////////////////////////////////////
_pos1 = [0,0];
_pos2 = [0,0];
_pos3 = [0,0];
_pos4 = [0,0];
_pos5 = [0,0];
_pos6 = [0,0];

while {SurfaceIsWater _pos1} do {
	_rand1 = random _radius - random _radius;_rand2 = random _radius - random _radius;
	_pos1 = [(_pos select 0)+_rand1,(_pos select 1)+_rand2,0];
};
while {SurfaceIsWater _pos2} do {
	_rand1 = random _radius - random _radius;_rand2 = random _radius - random _radius;
	_pos2 = [(_pos select 0)+_rand1,(_pos select 1)+_rand2,0];
};
while {SurfaceIsWater _pos3} do {
	_rand1 = random _radius - random _radius;_rand2 = random _radius - random _radius;
	_pos3 = [(_pos select 0)+_rand1,(_pos select 1)+_rand2,0];
};
while {SurfaceIsWater _pos4} do {
	_rand1 = random _radius - random _radius;_rand2 = random _radius - random _radius;
	_pos4 = [(_pos select 0)+_rand1,(_pos select 1)+_rand2,0];
};
while {SurfaceIsWater _pos5} do {	
	_rand1 = random _radius - random _radius;_rand2 = random _radius - random _radius;
	_pos5 = [(_pos select 0)+_rand1,(_pos select 1)+_rand2,0];
};
while {SurfaceIsWater _pos6} do {
	_rand1 = random _radius - random _radius;_rand2 = random _radius - random _radius;
	_pos6 = [(_pos select 0)+_rand1,(_pos select 1)+_rand2,0];
};
//////////////////////////////////////////////////////////////////////////////_guard setBehaviour "AWARE";
	deleteWaypoint [_guard, 0];
	deleteWaypoint [_guard, 1];
	_mission = "sad";
	_guard setFormation "STAG COLUMN";
	 _wp = _guard addWaypoint [(_pos) , 1];
	[_guard, 0] setWaypointType _mission;
	_guard setCurrentWaypoint [_guard, 0];
	_wp1a = _guard addWaypoint [(_pos1) , 3];
	[_guard, 1] setWaypointType _mission;
	_wp2 = _guard addWaypoint [(_pos2) , 3];
	[_guard, 1] setWaypointType _mission;
	_wp3 = _guard addWaypoint [(_pos3) , 3];
	[_guard, 2] setWaypointType _mission;
	_wp4 = _guard addWaypoint [(_pos4) , 3];
	[_guard, 3] setWaypointType _mission;
	_wp5 = _guard addWaypoint [(_pos5) , 3];
	[_guard, 4] setWaypointType _mission;
	_wp6 = _guard addWaypoint [(_pos6) , 3];
	[_guard, 5] setWaypointType _mission;
	_wp7 = _guard addWaypoint [(_pos) , 3];
	[_guard, 6] setWaypointType "CYCLE";