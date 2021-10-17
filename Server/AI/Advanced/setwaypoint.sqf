//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
//[group,"sad",position,"staggard column"] Spawn SetAIwaypoint
_group = _this select 0;
_mission = _this select 1;
_pos = _this select 2;
_formation = _this select 3;

deleteWaypoint [_group, 0];
deleteWaypoint [_group, 1];
 _group setFormation "staggard column";
 _wp = (_group) addWaypoint [_pos , 3];
 [_group, 0] setWaypointType _mission;
 _group setCurrentWaypoint [_group, 0];