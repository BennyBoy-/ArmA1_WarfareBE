//Last modified 4/6/8
//Description: Handles respawn of AI Leader.
Private["_barracks","_base","_body","_heavy","_heavyTypes","_infantryTypes","_leader","_light","_lightTypes","_list","_name","_position","_respawnMarker","_sideText","_sorted","_team","_teamType"];

_team = _this Select 0;
_name = _this Select 1;
_sideText = Str Side _team;
_sorted = [];

_respawnMarker = Format["%1TempRespawnMarker",_sideText];

_infantryTypes = Call Compile Format["%1InfantryTeamTypes",_sideText];
_lightTypes = Call Compile Format["%1LightTeamTypes",_sideText];
_heavyTypes = Call Compile Format["%1HeavyTeamTypes",_sideText];
_barracks = Call Compile Format["%1StructureNames Select %1BARRACKSTYPE",_sideText];
_light = Call Compile Format["%1StructureNames Select %1LIGHTTYPE",_sideText];
_heavy = Call Compile Format["%1StructureNames Select %1HEAVYTYPE",_sideText];

while {!IsPlayer Leader _team} do
{
	WaitUntil {!Alive Leader _team || IsPlayer Leader _team};

	if (!IsPlayer Leader _team) then
	{
		_body = Leader _team;

		WaitUntil {Alive Leader _team || IsPlayer Leader _team};

		if (!IsPlayer Leader _team) then
		{
			_leader = Leader _team;
			_leader SetPos GetMarkerPos _respawnMarker;

			Sleep 14;

			if (Alive _leader) then
			{
				_base = Call Compile Format["%1Base",_sideText];
				_teamType = Call Compile Format["%1AITeamType",_name];
				_structures = Call Compile Format["%1BaseStructures",_sideText];
				_list = [];

				//Find closest factory to respawn to.
				if (_teamType In _infantryTypes) then
				{
					{if ((TypeOf _x) == _barracks && GetDammage _x < 1) then {_list = _list + [_x]};} ForEach _structures;
				};

				if (_teamType In _lightTypes) then
				{
					{if ((TypeOf _x) == _light && GetDammage _x < 1) then {_list = _list + [_x]};} ForEach _structures;
				};

				if (_teamType In _heavyTypes) then
				{
					{if ((TypeOf _x) == _heavy && GetDammage _x < 1) then {_list = _list + [_x]};} ForEach _structures;
				};

				_position = [GetPos _base,10,25] Call GetRandomPosition;

				if (Count _list > 0) then
				{
					_sorted = [_body,_list] Call SortByDistance;
					_position = [GetPos (_sorted Select 0),10,25] Call GetRandomPosition;
				};

				_leader SetPos _position;
				_leader RemoveAllEventHandlers "killed";
				[_leader,Side _team] Call InitUnit;
				_leader Call EquipDefaultLoadout;
			};
		};
	};
};

//*****************************************************************************************
//1/10/8 MM - Created file.
