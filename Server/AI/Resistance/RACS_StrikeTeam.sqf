_units = _this select 0;
_locRaw = _this select 1;
_delay = _this select 2;
_group = createGroup resistance;
_exit = false;
_count = 0;

sleep _delay;

_locationAttack = Corazol;

while {!_exit}do{

	_currentUnit = _units select _count;
	//unit
	_unit = _group CreateUnit [_currentUnit,GetPos _locRaw,[],1,"FORM"];
	[_unit,Resistance] Call InitUnit;
	_count = _count + 1;
	
	if (_count >= count _units) then {_exit = true};
};
	
	//waypoints
	deleteWaypoint [_group, 0];
	deleteWaypoint [_group, 1];
	_mission = "sad";
	_group setFormation "STAG COLUMN";
	_group setBehaviour "SAFE";
	
	 _wp = _group addWaypoint [(_locationAttack) , 30];
	[_group, 0] setWaypointType _mission;
	_group setCurrentWaypoint [_group, 0];
	_wpc = _group addWaypoint [(_locationAttack) , 40];
	[_group, 1] setWaypointType "CYCLE";

[_group] ExecVM "Server\AI\Resistance\RACS_Group.sqf";
[_units,_group,_locRaw] ExecVM "Server\AI\Resistance\RACS_StrikeTeamUpdate.sqf";