//Last modified 2/19/8
//Run any common initialization on a unit including cleanup routines after death.
Private["_side","_unit","_unitType"];

_unit = _this Select 0;
_side = _this Select 1;

Call Compile Format["_unit AddEventHandler [""killed"",{[_this,""%1""] Execvm ""Common\Common_UnitKilled.sqf""}]",_side];

_unitType = TypeOf _unit;

if (_unitType In soldierUnits) then
{
	if (time > 15) then
	{
		if (Call Compile Format["!IsNil ""%1UnitsCreated""",Str _side]) then
		{
			Call Compile Format["%1UnitsCreated = %1UnitsCreated + 1;PublicVariable ""%1UnitsCreated""",Str _side];
		};
	};
}
else
{
	if (_unitType In (lightUnits + heavyUnits + aircraftUnits + wingedAircraftUnits)) then
	{
		_unit SetVehicleInit "this ExecVM ""Common\Init\Init_Vehicle.sqf""";
		ProcessInitCommands;

		if (time > 15) then
		{
			if (Call Compile Format["!IsNil ""%1VehiclesCreated""",Str _side]) then
			{
				Call Compile Format["%1VehiclesCreated = %1VehiclesCreated + 1;PublicVariable ""%1VehiclesCreated""",Str _side];
			};
		};

		if (ABANDONEDVEHICLETIME > 0) then
		{
			_unit AddEventHandler ["GetOut",{_this Spawn UpdateEmptyVehicle}];
		};
	};
};

//2/22/7 MM - Created file.
