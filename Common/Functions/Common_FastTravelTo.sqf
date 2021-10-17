//Last modified 2/5/8
//Get the direction from source to destination.
Private["_count","_destination","_direction","_distance","_leader","_nonFTTypes","_position","_type","_unit","_units","_vehicle","_vehicles"];

_leader = _this Select 0;
_destination = _this Select 1;

_position = GetPos _leader;
_units = Units Group _leader;
_vehicles = [];
_direction = 0;
_distance = 11;
_nonFTTypes = Call Compile Format["%1WingedAircraftUnits + %1AircraftUnits + %1DefenseNames",Str Side _leader];

for [{_count = Count _units - 1},{_count >= 0},{_count = _count - 1}] do
{
	_unit = _units Select _count;
	_vehicle = Vehicle _unit;
	_type = TypeOf _vehicle;

	if (GetDammage _vehicle < 1) then
	{
		if (([_position,GetPos _unit] Call GetDistance < FASTTRAVELTEAMRANGE) && (currentCommand _unit != "STOP")) then
		{
			if (!(_vehicle In _vehicles) && !(IsNull Driver _vehicle) && !(_type In _nonFTTypes)) then
			{
				_destination = [(_destination Select 0)+((sin _direction)*_distance),(_destination Select 1)+((cos _direction)*_distance),0];
				_vehicle SetPos _destination;

				_direction = _direction + 45;
				if (_direction >= 360) then
				{
					_direction = 0;
					_distance = _distance + 11;
				};
			};
		};
	};

	//Don't want place a vehicle more than once.
	_vehicles = _vehicles + [_vehicle];
};

//12/13/7 MM - Created file.
