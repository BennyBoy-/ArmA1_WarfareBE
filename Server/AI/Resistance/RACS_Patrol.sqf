_units = _this select 0;
_locRaw = _this select 1;
_location = position (_this select 1);
_townsArray = _this select 2;
_delay = _this select 3;
_group = createGroup resistance;
_exit = false;
_count = 0;
_soldierName = GCREW;
_unitsArray = [];
_vehisArray = [];

sleep _delay;

while {!_exit}do{

	_position = [(_location select 0) - 20 + (random 40),(_location select 1) - 20 + (random 40),(_location select 2)];
	_currentVehi = _units select _count;
	
	//Armor
	_vehicle = _currentVehi CreateVehicle _position;
	_vehicle lock true;
	_vehisArray = _vehisArray + [_vehicle];
	[_vehicle,Resistance] Call InitUnit;
	
	//driver
	_driver = _group CreateUnit [_soldierName,GetPos _vehicle,[],1,"FORM"];
	[_driver] AllowGetIn true;
	_driver MoveInDriver _vehicle;
	_unitsArray = _unitsArray + [_driver];
	[_driver,Resistance] Call InitUnit;
	
	//gunner
	_gunner = _group CreateUnit [_soldierName,GetPos _vehicle,[],1,"FORM"];
	[_gunner] AllowGetIn true;
	_gunner MoveInGunner _vehicle;
	_unitsArray = _unitsArray + [_gunner];
	[_gunner,Resistance] Call InitUnit;
	
	if (_currentVehi == "T72_RACS") then {_commander = _group CreateUnit [_soldierName,GetPos _vehicle,[],1,"FORM"];[_commander] AllowGetIn true;_commander MoveInCommander _vehicle;_unitsArray = _unitsArray + [_commander];[_commander,Resistance] Call InitUnit;};
	
	_count = _count + 1;
	
	if (_count >= count _units) then {_exit = true};
};
	
	_count = 1;

	//waypoints
	deleteWaypoint [_group, 0];
	deleteWaypoint [_group, 1];
	_mission = "sad";
	_group setFormation "COLUMN";
	
	 _wp = _group addWaypoint [(_townsArray select 0) , 20];
	[_group, 0] setWaypointType _mission;
	_group setCurrentWaypoint [_group, 0];
	{Call Compile Format ["_wp%1 = _group addWaypoint [(_x) , 20];",_count];[_group, 1] setWaypointType _mission;_count = _count + 1;} forEach _townsArray;
	Call Compile Format ["_wp%1 = _group addWaypoint [(_townsArray select 0) , 20];",_count];
	[_group, 20] setWaypointType "CYCLE";

[_group] ExecVM "Server\AI\Resistance\RACS_Group.sqf";
[_vehisArray,_unitsArray,_group,_locRaw,_units,_townsArray] ExecVM "Server\AI\Resistance\RACS_PatrolUpdate.sqf";