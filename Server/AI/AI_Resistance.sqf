_guard = _this Select 0;
_location = _this Select 1;
_radius = _this Select 2;
_radius = _radius + 500;
_locationSide = Resistance;
_pos = GetMarkerPos Format["%1CenterMarker",Str _location];
while {SurfaceIsWater _pos} do {
	_rand1 = random _radius - random _radius;_rand2 = random _radius - random _radius;
	_pos = [(_pos select 0)+_rand1,(_pos select 1)+_rand2,0];
};
_timePassed = 0;
_camps = Call Compile Format["%1Camps",Str _location];

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
//////////////////////////////////////////////////////////////////////////////
_guard setBehaviour "AWARE";
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