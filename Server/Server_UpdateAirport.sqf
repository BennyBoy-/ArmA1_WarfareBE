//Last modified 2/5/8
//*****************************************************************************************
//Description: Monitors an airport for capture.
//*****************************************************************************************
Private["_airport","_airportStr","_east","_livingUnits","_name","_objects","_position","_side","_west"];

_airport = _this Select 0;
_name = _this Select 1;

WaitUntil {gameInitialized};

_airportStr = Str _airport;

Call Compile Format["%1Name = _name",_airportStr];

if (!IsServer) ExitWith {};

_position = GetPos _airport;

Call Compile Format["%1Side = Resistance",_airportStr];
Format ["%1Side",_airportStr] AddPublicVariableEventHandler {[_airport,_this Select 1,_this Select 0] Call AirportCaptured};

while {GetDammage _airport < 1} do
{
	_side = Call Compile Format["%1Side",_airportStr];

	//Check for enemy activity.
	_objects = NearestObjects[_position,["Man","Air","Car","Motorcycle","Tank"],30];

	_livingUnits = _objects Call GetLiveUnits;
	_east = East CountSide _livingUnits;
	_west = West CountSide _livingUnits;

	if (_east > 0 && _side != East) then
	{
		if (_west == 0) then
		{
			Call Compile Format["%1Side = East;PublicVariable ""%1Side""",_airportStr];

			if (Local player) then
			{
				[_airport,Call Compile Format["%1Side",_airportStr]] Call AirportCaptured;
			};
		};
	};

	if (_west > 0 && _side != West) then
	{
		if (_east == 0) then
		{
			Call Compile Format["%1Side = West;PublicVariable ""%1Side""",_airportStr];

			if (Local player) then
			{
				[_airport,Call Compile Format["%1Side",_airportStr]] Call AirportCaptured;
			};
		};
	};

	Sleep 2;
};

//*****************************************************************************************
//2/2/8 MM - Created file.
