//Town racs assault script by Benny 13-04-09.
Private ["_group","_location","_name","_sorted","_type","_unitArray","_vehicleArray"];
_type = _this select 0;
_location = _this select 1;
_name = _this select 2;

//in case it don't belong here we use default values.
_unitArray = [GLEADER,GATSOLDIER,GMARKSMAN,GMEDIC];
_vehicleArray = ["LandroverMG"];

_group = createGroup resistance;
//We tell the server that the team is created and that creating another can't be done atm.
Call Compile Format ["%1TeamNameAlive = true",_name];

//we check the type.
if (_type == "heavy") then {
	_unitArray = [GLEADER,GATSOLDIER,GSPECOP,GATSOLDIER,GGUARD,GATSOLDIER,GAASOLDIER,GAASOLDIER,GAASOLDIER,GSNIPER,GMEDIC,GMEDIC];
	_vehicleArray = ["M113_RACS","M113_RACS"];
};
if (_type == "medium") then {
	_unitArray = [GLEADER,GATSOLDIER,GATSOLDIER,GATSOLDIER,GAASOLDIER,GGUARD,GGUARD,GSNIPER,GMGSOLDIER,GMEDIC,GMEDIC,GMEDIC];
	_vehicleArray = ["M113_RACS","M113_RACS"];
};
if (_type == "light") then {
	_unitArray = [GLEADER,GSOLDIER,GSOLDIER,GATSOLDIER,GMARKSMAN,GMGSOLDIER,GMEDIC,GSNIPER];
	_vehicleArray = ["M113_RACS"];
};

//we create units.
{
	_unit = _group CreateUnit [_x,_location,[],1,"FORM"];
	_unit setSkill 1;
	[_unit,Resistance] Call InitUnit;
} forEach _unitArray;

//we create vehicles and crews and we assign the vehicle to the team.
{
	_crew = GCREW;
	if (_x isKindOf "car") then {_crew = GSOLDIER};
	_vehi = _x createVehicle _location;
	[_vehi,Resistance] Call InitUnit;
	
	_driver = _group CreateUnit [_crew,_location,[],1,"FORM"];
	_driver setSkill 1;
	_driver moveInDriver _vehi;
	[_driver,Resistance] Call InitUnit;
	
	_gunner = _group CreateUnit [_crew,_location,[],1,"FORM"];
	_gunner setSkill 1;
	_gunner moveInGunner _vehi;
	[_gunner,Resistance] Call InitUnit;
	
	_group addVehicle _vehi;
} forEach _vehicleArray;

//we grab differents factories.
_listW = [West] Call GetFactories;
_listE = [East] Call GetFactories;

//hqs are added, if's deployed or not deployed doesn't matter.
_westBase = WestMHQ;
_eastBase = EastMHQ;
if (isNull(WestMHQ)) then {_westBase = WestBase};
if (isNull(EastMHQ)) then {_eastBase = EastBase};
if (isNull(WestBase)) then {_westBase = objNull};
if (isNull(EastBase)) then {_eastBase = objNull};

//we add all building in one array.
_gbList = _listW + _listE + [_westBase] + [_eastBase] - [objNull];
_total = count _gbList;
_sorted = [_location,_gbList] Call SortByDistance;

//getting 3 random locations.
_assault = _sorted select (floor(random(_total)));
_assault1 = _sorted select (floor(random(_total)));
_assault2 = _sorted select (floor(random(_total)));

deleteWaypoint [_group, 0];
deleteWaypoint [_group, 1];
//group has a search and destroy objective.
_mission = "sad";
//group is using a stag column formation.
_group setFormation "STAG COLUMN";
//group is on aware behaviour as it 'patrol'.
_group setBehaviour "AWARE";
//group use a normal speed so units remain in formation.
_group setSpeedMode "NORMAL";

//random waypoints to enemies structures.
 _wp = _group addWaypoint [(_assault) , 30];
[_group, 0] setWaypointType _mission;
_group setCurrentWaypoint [_group, 0];
 _wp2 = _group addWaypoint [(_assault1) , 30];
[_group, 0] setWaypointType _mission;
 _wp2 = _group addWaypoint [(_assault2) , 30];
[_group, 0] setWaypointType _mission;
_wpc = _group addWaypoint [(_assault) , 40];
[_group, 1] setWaypointType "CYCLE";

// we trackthe group with the town name, once it dies, we tell the server_updatetown.sqs that he can spawn a new team.
[_group,_name] Spawn AIGroup;