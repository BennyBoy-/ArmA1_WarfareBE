//Last modified 05/3/07
//*****************************************************************************************
//Description: Create and sort the control sequence for a squad's mission.
//_this = [team name, current location, nearest mission]
//*****************************************************************************************
Private["_name","_currentLocation","_nearestMission","_sequences","_total","_sequence","_sequenceCount","_sequenceCount2"];

_name = _this Select 0;
_currentLocation = _this Select 1;
_nearestMission = _this Select 2;
Call Compile Format["_sequences = %1ControlSequence",_nearestMission];
_sequence = [];
_total = Count _sequences;

	for [{_sequenceCount = 0, _sequence = _sequences select _sequenceCount},{_sequenceCount < _total},{_sequenceCount = _sequenceCount + 1}] do
	{
		_sequence = (_sequences select _sequenceCount);
		if ((_sequence find _currentLocation > -1) and (_sequence find _nearestMission > -1)) then
		{
			Call Compile Format["%1Sequence = _sequence",_name];
			//Sort the sequence, ensuring the nearest friendly town is always the first element
			if (_currentlocation != (_sequence select 0)) then
			{
				Call Compile Format["%1Sequence = []",_name];
				for [{_sequenceCount2 = (count _sequence - 1)},{_sequenceCount2 >= 0},{_sequenceCount2 = _sequenceCount2 - 1}] do
				{
					Call Compile Format["%1Sequence = %1Sequence + [(_sequence select _sequenceCount2)]",_name];
				};
			};
		};
	};
	
Call Compile Format["%1Sequence",_name];

//*****************************************************************************************
//05/3/07 BvP - Created file.
