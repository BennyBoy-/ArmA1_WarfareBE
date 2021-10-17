//Last modified 3/11/8
//Description: Manages player's build queue.
Private["_count","_total","_type","_unitType","_factory","_empty","_team","_typesChecked"];

while {!gameOver} do
{
	_typesChecked = [];
	_total = Count buildQueue;

	for [{_count = 0},{_count < _total},{_count = _count + 1}] do
	{
		_factory = buildQueueFactory Select _count;
		_unitType = buildQueue Select _count;
		_factoryType = buildQueueFactoryType Select _count;

		if (!IsNull _factory) then
		{
			if (!(_factoryType In _typesChecked) && !(_factory In baseStructuresInUse) && !(_factory In JIPBaseStructuresInUse)) then
			{
				_empty = buildQueueEmpty Select _count;
				_team = buildQueueTeam Select _count;

				if (GetDammage _factory < 1) then
				{
					[_factoryType,_unitType,_factory,_empty,_team] Execvm "Client\Client_BuyUnit.sqf";
					_typesChecked = _typesChecked + [_factoryType];
				};

				buildQueueFactory Set[_count,"**DELETE**"];
				buildQueue Set[_count,"**DELETE**"];
				buildQueueFactoryType Set[_count,"**DELETE**"];
				buildQueueEmpty Set[_count,"**DELETE**"];
				buildQueueTeam Set[_count,"**DELETE**"];
			};
		}
		else
		{
			buildQueueFactory Set[_count,"**DELETE**"];
			buildQueue Set[_count,"**DELETE**"];
			buildQueueFactoryType Set[_count,"**DELETE**"];
			buildQueueEmpty Set[_count,"**DELETE**"];
			buildQueueTeam Set[_count,"**DELETE**"];
		};
	};

	buildQueueFactory = buildQueueFactory - ["**DELETE**"];
	buildQueue = buildQueue - ["**DELETE**"];
	buildQueueFactoryType = buildQueueFactoryType - ["**DELETE**"];
	buildQueueEmpty = buildQueueEmpty - ["**DELETE**"];
	buildQueueTeam = buildQueueTeam - ["**DELETE**"];

	Sleep 0.5;
};

//*****************************************************************************************
//3/11/8 MM - Created file.
