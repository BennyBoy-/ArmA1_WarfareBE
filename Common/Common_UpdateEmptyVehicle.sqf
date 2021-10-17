//Last modified 4/25/8
//Run any common initialization on a unit including cleanup routines after death.
Private["_destroy","_timeLeft","_vehicle"];

_vehicle = _this Select 0;
_destroy = true;

if (Count Crew _vehicle > 0) ExitWith {};

//If vehicle stays empty for 5 minutes then remove it.
for [{_timeLeft = ABANDONEDVEHICLETIME},{_timeLeft > 0},{_timeLeft = _timeLeft - 20}] do
{
	Sleep 20;

	if (Count Crew _vehicle > 0) ExitWith {_destroy = false};
};

if (_destroy) then
{
	//Avoid explosions...;)
	if (TypeOf _vehicle == WAMMOTRUCK || TypeOf _vehicle == EAMMOTRUCK) then
	{
		DeleteVehicle _vehicle;
	}
	else
	{
		_vehicle SetDammage 1;
	};
};

//12/16/7 MM - Created file.
