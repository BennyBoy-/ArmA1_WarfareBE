//Last modified 4/25/8
//Description:  Tracks a unit by creating a marker that follows it.
Private["_type","_unit"];

_unit = _this;
_type = TypeOf _unit;
_unit setvelocity [0,0,1];

WaitUntil {gameInitialized};

if (Local player) then
{
	if (sideJoined == East || sideJoined == West) then
	{
	if (Call Compile Format["_type In (%1LightUnits + %1HeavyUnits + %1AircraftUnits + %1WingedAircraftUnits)",sideJoinedText]) then
	{
		[_unit,sideJoined] Exec "Client\Client_UpdateUnitMarker.sqs";

		if (_type == WREPAIRTRUCK || _type == EREPAIRTRUCK) then
		{
			//_unit AddAction[Localize "STRWFBUILDDEFENSES","Client\Action\Action_UseRepairTruck.sqs"];
			};
		};
	};
};

if (IsServer) then
{
	if (_type == ESALVAGETRUCK) then
	{
		[East,_unit] Exec "Server\Server_UpdateSalvager.sqs";
	};

	if (_type == WSALVAGETRUCK) then
	{
		[West,_unit] Exec "Server\Server_UpdateSalvager.sqs";
	};
};

//5/18/7 MM - Created file.
