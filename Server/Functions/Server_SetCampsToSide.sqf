//Last modified 11/12/7
//Sets all camps in town to specified side.
//Usually done when a town is captured.
Private["_camp","_camps","_count","_notifyAllSides","_objects","_previousSide","_side","_sideID","_startingSV","_town"];

_town = _this Select 0;
_side = _this Select 1;
_previousSide = _this Select 2;

_sideID = _side Call GetSideID;
_camps = Call Compile Format["%1Camps",Str _town];
_startingSV = Call Compile Format["%1SupplyValue",Str _town];

//Check all camp sites for a constructed camp.
for [{_count = Count _camps - 1},{_count >= 0},{_count = _count - 1}] do
{
	_camp = _camps Select _count;
	Call Compile Format["%1SideID = _sideID;PublicVariable ""%1SideID""",Str _camp];
	Call Compile Format["%1SupplyValue = _startingSV;PublicVariable ""%1SupplyValue""",Str _camp];

	//Set flag to new side.
	_texture = "\ca\misc\data\sever_vlajka.paa";
	_defenses = westDefenseNames;
	if (_side == West) then {_texture = "\ca\misc\data\usa_vlajka.pac";_defenses = eastDefenseNames};

	//Delete previous side's defenses.
	_defenseObjects = NearestObjects[_camp,_defenses,35];
	{DeleteVehicle _x} ForEach _defenseObjects;

	_objects = NearestObjects[_camp,["FlagCarrierSouth"],20];
	if (Count _objects > 0) then {(_objects Select 0) SetFlagTexture _texture};
};

_notifyAllSides = (_previousSide == East || _previousSide == West);
//Inform clients to clean up, change marker, etc.
[CMDALLCAMPSCAPTURED,_town,_sideID,_notifyAllSides] Exec "Server\Server_CommandToClients.sqs";

//10/26/7 MM - Created file.
