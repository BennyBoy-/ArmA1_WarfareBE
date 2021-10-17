//Last modified 4/25/8
//*****************************************************************************************
Private["_capturingCamp","_icons","_images","_objects","_repair","_textControl","_usable"];

_repair = WREPAIRTRUCK;
if (sideJoined == East) then {_repair = EREPAIRTRUCK};

_HQ = Call Compile Format["%1StructureNames Select %1HEADQUARTERSTYPE",sideJoinedText];

_names = Call Compile Format["%1StructureNames",sideJoinedText];
_structures = Call Compile Format["[_names Select %1BARRACKSTYPE,_names Select %1LIGHTTYPE,_names Select %1HEAVYTYPE,_names Select %1AIRCRAFTTYPE]",sideJoinedText];
_icons = ["\Warfare\Images\icon_barracks.paa","\Warfare\Images\icon_light.paa","\Warfare\Images\icon_heavy.paa","\Warfare\Images\icon_aircraft.paa","\Warfare\Images\icon_airport.paa"];

_loop = 0;

while {!gameOver} do
{
	Sleep 1.5;

	_MHQ = Call Compile Format["%1MHQ",sideJoinedText];
	_loop = _loop + 1;

	//Check for nearby repair trucks.
	_objects = (Vehicle player NearObjects[_repair,15]) Call GetUndestroyedUnits;

	if (Count _objects > 0) then
	{
		repairTruckInRange = _objects Select 0;
	}
	else
	{
		repairTruckInRange = ObjNull;
	};

	//Check for nearby camps.
	_capturingCamp = false;
	campInRange = ObjNull;
	_objects = Vehicle player NearObjects["WarfareBCamp",10];

	if (Count _objects > 0) then
	{
		if (Call Compile Format["%1SideID == sideID",Str (_objects Select 0)]) then
		{
			campInRange = _objects Select 0;
		}
		else
		{
			_capturingCamp = true;
		};
	};

	//Check for nearby depot.
	depotInRange = false;
	_objects = Vehicle player NearObjects["WarfareBDepot",30];

	if (Count _objects > 0) then
	{
		if (Call Compile Format["%1SideId == sideID",Str (_objects Select 0)]) then
		{
			depotInRange = true;
			_icons Set [Count _icons - 1,"\Warfare\Images\icon_service_station.paa"];
		}
	};

	//Check for nearby airport.
	airportInRange = false;
	_objects = Vehicle player NearObjects["WarfareBAirport",30];

	if (Count _objects > 0) then
	{
		if (Call Compile Format["%1Side == sideJoined",Str (_objects Select 0)]) then
		{
			airportInRange = true;
			_icons Set [Count _icons - 1,"\Warfare\Images\icon_airport.paa"];
		}
	};

	//Check every 3 seconds.
	if (_loop > 1) then
	{
		_loop = 0;

		HQInRange = ObjNull;

		//If player is commander then check for a functioning nearby HQ.
		if (!IsNull commanderTeam) then
		{
			if (Group player == commanderTeam) then
			{
				_objects = Vehicle player NearObjects[_HQ,CONSTRUCTIONRANGE];

				//Check for MHQ (if it has not been deployed).			
				if (!IsNull _MHQ) then
				{
					_objects = _objects + (player NearObjects[TypeOf _MHQ,CONSTRUCTIONRANGE]);
				};

				if (Count _objects > 0) then
				{
					if (GetDammage (_objects Select 0) < 1) then
					{
						HQInRange = _objects Select 0;
					};
				};
			};
		};

		_objectsNoRemote = NearestObjects[Vehicle player,_structures,BASERANGE] Call GetUndestroyedUnits;
		_objects = NearestObjects[(Vehicle player),_structures,REMOTEBASERANGE] Call GetUndestroyedUnits;

		_types = [];
		{_types = _types + [TypeOf _x]} ForEach _objects;

		barracksInRange = false;
		noRemoteGearBuy = false;
		lightFactoryInRange = false;
		heavyFactoryInRange = false;
		aircraftFactoryInRange = false;
		
		if ((_structures Select 0) In _types) then {barracksInRange = true};
		if ((_structures Select 1) In _types) then {lightFactoryInRange = true};
		if ((_structures Select 2) In _types) then {heavyFactoryInRange = true};
		if ((_structures Select 3) In _types) then {aircraftFactoryInRange = true};
		// Check if inside BASERANGE for actions that are only allowed at base/near barracks like gear/loadout to avoid exploit
		_types = [];
		{_types = _types + [TypeOf _x]} ForEach _objectsNoRemote;
		if ((_structures Select 0) In _types) then {noRemoteGearBuy = true};
		
	};

	if (barracksInRange || lightFactoryInRange || heavyFactoryInRange || aircraftFactoryInRange || airportInRange || depotInRange || (!IsNull campInRange && !townCaptureProgressBarActive)) then
	{
		if (IsNull currentCutDisplay) then
		{
			CutRsc["UseObject","PLAIN",0];
			WaitUntil {!IsNull currentCutDisplay};
		};

		_usable = [barracksInRange || !(IsNull campInRange),lightFactoryInRange,heavyFactoryInRange,aircraftFactoryInRange,airportInRange || depotInRange];

		//Create list of icons for usable structures & display them.
		_count = 0;
		_count1 = 0;
		_images = ["","","","",""];
		{if (_x) then {_images Set[_count,_icons Select _count1];_count = _count + 1} else {_images = _images + [""]};_count1 = _count1 + 1} ForEach _usable;

		_count = 0;
		{(currentCutDisplay DisplayCtrl (IDCGENERICIMAGE + _count)) CtrlSetText _x;_count = _count + 1} ForEach _images;

		_textControl = currentCutDisplay DisplayCtrl IDCMenuInfo;
		_textControl CtrlSetText Format[Localize "STRWFTOUSE",ActionKeysNames["TeamSwitch",1]]
	}
	else
	{
		if (!_capturingCamp && !townCaptureProgressBarActive && !IsNull currentCutDisplay) then
		{
			CutText["","PLAIN"];
		};
	};
};

//*****************************************************************************************
//1/26/8 MM - Created file.
