//Last modified 4/23/8
//Description: Monitors a town for enemy activity.
//If there is activity, no friendlies present, and enough supply then a defense team will be spawned.
//Will also man some empty stationary defenses.
//Used for east or west defenses.
//[town] Spawn UpdateTownDefense
Private["_center","_defenses","_defensesOnly","_defenseTypes","_detectionRange","_emptyDefenses","_enemies","_friendlies","_location","_objects","_opposingSide","_patrolRange","_position","_name","_side","_sideID","_SV","_unitTypes"];

_location = _this Select 0;

//Get town variables.
_name = Str _location;
_detectionRange = Call Compile Format["%1Range",_name];
_patrolRange = _detectionRange * DETECTIONTOPATROLRANGERATIO;

//Defenses are spawned from town's center (not town's depot).
_center = GetMarkerPos Format["%1CenterMarker",_name];

while {true} do
{
	Sleep 3;

	_SV = Call Compile Format["%1SupplyValue",_name];
	_sideID = Call Compile Format["%1SideID",_name];

	//Check if town does not belong to resistance & has enough supplies for a defense team.
	if (_SV >= SMALLDEFENSESUPPLIES && (_sideID == EASTID || _sideID == WESTID)) then
	{
		_opposingSide = West;
		if (_sideID == WESTID) then {_opposingSide = East};

		_side = _sideID Call GetSideFromID;

		//Check for enemy activity.
		_objects = NearestObjects[_center,["Man","Air","Car","Motorcycle","Tank"],_detectionRange];

		_livingUnits = _objects Call GetLiveUnits;
		_enemies = (Resistance CountSide _livingUnits) + (_opposingSide CountSide _livingUnits);

		if (_enemies > 0) then
		{
			//Check for defenses & man up to 8 empty ones.
			_defenseTypes = Call Compile Format["%1DefenseNames",Str _side];
			_defenses = NearestObjects[_center,_defenseTypes,_detectionRange * 0.6];

			_emptyDefenses = [];
			{if (_x EmptyPositions "gunner" > 0) then {_emptyDefenses = _emptyDefenses + [_x]};} ForEach _defenses;

			//Do not spawn a defense team if a few friendlies are already in the area.
			//Always spawn a defense team if there are empty defenses.
			_friendlies = (_side CountSide _livingUnits);
			if (_friendlies < 8 || Count _emptyDefenses > 0) then
			{
				_unitTypes = Call Compile Format["%1AITeamTemplates Select (%1DefenseTeamTypes Select (Random (Count %1DefenseTeamTypes - 1)))",Str _side];

				if (_SV >= LARGEDEFENSESUPPLIES) then
				{
					_unitTypes = Call Compile Format["%1AITeamTemplates Select (%1LargeDefenseTeamTypes Select (Random (Count %1LargeDefenseTeamTypes - 1)))",Str _side];
				};

				//If there are more than a few unit in town then only create units for defenses (no extra patrolling units).
				_defensesOnly = false;
				if (_friendlies >= 8) then {_defensesOnly = true};

				_position = [_center,0,_patrolRange] Call GetRandomPosition;
				[_location,_position,_side,_unitTypes,DEFENSEINACTIVETIME,_emptyDefenses,_defensesOnly] Spawn AITownDefense;

				Sleep DEFENSEINACTIVETIME;
			}
			else
			{
				//If there are already living defensive units then slow down checks.
				Sleep 30;
			};
		};
	};
};

//*****************************************************************************************
//1/13/8 MM - Created file.
