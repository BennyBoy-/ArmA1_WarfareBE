//Last modified 5/9/8
//*****************************************************************************************
//Description: Aim and fire artillery.
//*****************************************************************************************

Private["_ammo","_angle","_arcDistance","_artillery","_destination","_direction","_distance","_minRange","_maxRange","_position","_radius","_shell","_side","_type","_typeShell","_velocity","_weapon","_x","_y"];

_artillery = _this Select 0;
_destination = _this Select 1;
_side = _this Select 2;
_radius = _this Select 3;
_typeRound = _this Select 4;

_type = Call Compile Format["%1ArtilleryNames Find TypeOf _artillery",Str _side];
if (_type == -1) ExitWith {};

_minRange = Call Compile Format["%1ArtilleryMinRanges Select _type",Str _side];
_maxRange = Call Compile Format["%1ArtilleryMaxRanges Select _type",Str _side];
_weapon = Call Compile Format["%1ArtilleryWeapons Select _type",Str _side];
_ammo = Call Compile Format["%1ArtilleryAmmos Select _type",Str _side];
_velocity = Call Compile Format["%1ArtilleryVelocities Select _type",Str _side];
_dispersion = Call Compile Format["%1ArtilleryDispersions Select _type",Str _side];
_typeShell = "";

if (IsNull Gunner _artillery) ExitWith {};
if (IsPlayer Gunner _artillery) ExitWith {};

_position = GetPos _artillery;
_x = (_destination Select 0) - (_position Select 0);
_y = (_destination Select 1) - (_position Select 1);

_direction =  -(((_y atan2 _x) + 270) % 360);
if (_direction < 0) then {_direction = _direction + 360};

_distance = sqrt ((_x ^ 2) + (_y ^ 2)) - _minRange;
_angle = _distance / (_maxRange - _minRange) * 100 + 15;

if (_angle > 90) then {_angle = 90};
if (_distance < 0 || _distance + _minRange > _maxRange) ExitWith {};

_watchPosition = [(_position Select 0) + (sin _direction) * 50,(_position Select 1) + (cos _direction) * 50,_angle];
Gunner _artillery DoWatch _watchPosition;

Sleep (3 + Random 3);

_amount = _artillery Ammo _weapon;
_artillery Fire _weapon;

WaitUntil {_artillery Ammo _weapon < _amount};

_shell = nearestObject [_artillery,_ammo];
_shell SetPos [0,0,1000 + Random 20];
_shell SetVelocity [0,0,0];

_arcDistance = sqrt((_distance ^ 2) * 2);

Sleep (_arcDistance / _velocity);

if (_typeRound == 0) then {
	_distance = Random (_distance / _maxRange * 100) + Random _radius;
	_direction = Random 360;
	_shell SetPos [(_destination Select 0)+((sin _direction)*_distance),(_destination Select 1)+((cos _direction)*_distance),400];
	_destination = [(_destination Select 0)+((sin _direction)*_distance),(_destination Select 1)+((cos _direction)*_distance),400];
	_shell SetVelocity [0,0,-_velocity];
};

if (_typeRound == 1) then {
	_typeShell = (ArtilleryRoundType select 0);
	deleteVehicle _shell;
	_distance = Random (_distance / _maxRange * 100) + Random _radius;
	_direction = Random 360;
	_shell SetPos [(_destination Select 0)+((sin _direction)*_distance),(_destination Select 1)+((cos _direction)*_distance),400];
	_destination = [(_destination Select 0)+((sin _direction)*_distance),(_destination Select 1)+((cos _direction)*_distance),400];
	for [{_x=1},{_x<=MAXCLUSTERAP},{_x=_x+1}] do {		
		_shell = _typeShell createVehicle [0,0,2000];
		_shell SetVelocity [0,0,0];
		_shell setPos [(_destination select 0)-random(20)+random(40),(_destination select 1)-random(20)+random(40),0];
		_shell SetVelocity [0,0,-_velocity];
	};
};

if (_typeRound == 2) then {
	_typeShell = (ArtilleryRoundType select 1);
	deleteVehicle _shell;
	_distance = Random (_distance / _maxRange * 100) + Random _radius;
	_direction = Random 360;
	_shell SetPos [(_destination Select 0)+((sin _direction)*_distance),(_destination Select 1)+((cos _direction)*_distance),400];
	_destination = [(_destination Select 0)+((sin _direction)*_distance),(_destination Select 1)+((cos _direction)*_distance),400];
	for [{_x=1},{_x<=MAXCLUSTER},{_x=_x+1}] do {		
		_shell = _typeShell createVehicle [0,0,2000];
		_shell SetVelocity [0,0,0];
		_shell setPos [(_destination select 0)-random(20)+random(40),(_destination select 1)-random(20)+random(40),0];
		_shell SetVelocity [0,0,-_velocity];
	};
};

//*****************************************************************************************
//12/18/7 MM - Created file.
