_l		= ["ClientInitialized"];
_l = _l + ["RequestBuildDefense"];
_l = _l + ["RequestBuildStructure"];
_l = _l + ["RequestChangeScore"];
_l = _l + ["RequestCommanderVote"];
_l = _l + ["RequestUseStructure"];
_l = _l + ["RequestVehicleLock"];
_l = _l + ["VehicleDestroyed"];
_l = _l + ["RequestCommandToPlayer"];
_l = _l + ["RequestDestroyDefense"];
_l = _l + ["RequestMHQRepair"];
_l = _l + ["RequestNuke"];

serverCommandPV = _l;

_l		= ["InitGame"];
_l = _l + ["StartGame"];
_l = _l + ["AllCampsCaptured"];
_l = _l + ["CampCaptured"];
_l = _l + ["ChangeScore"];
_l = _l + ["TownCaptured"];
_l = _l + ["TownCapturedPublic"];
_l = _l + ["AwardBounty"];
_l = _l + ["EndGame"];
_l = _l + ["JIPInitTownsAndCamps"];
_l = _l + ["JIPStructureInUse"];
_l = _l + ["SetStructureDirection"];
_l = _l + ["SetVehicleLock"];
_l = _l + ["StructureInUse"];
_l = _l + ["SideMessage"];
_l = _l + ["SideLocationMessage"];
_l = _l + ["VehicleSalvaged"];
_l = _l + ["CommandToPlayer"];
_l = _l + ["ShowDefenseDestroyed"];
_l = _l + ["StartNuke"];

clientCommandPV = _l;

clientCommandsSent = 0;
publicVariablesSent = 0;

for [{_count = Count serverCommandPV - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1 = 0",serverCommandPV Select _count];};
for [{_count = Count clientCommandPV - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1 = 0",clientCommandPV Select _count];};

for [{_count = Count clientCommandPV - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["CMD%1 = %2",clientCommandPV Select _count,_count];};
for [{_count = Count serverCommandPV - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["CMD%1 = %2",serverCommandPV Select _count,_count];};

for [{_count = Count clientCommandPV - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["CLTFNC%1 = Compile PreprocessFile ""Client\PVFunctions\%1.sqf""",clientCommandPV Select _count,_count];};
for [{_count = Count serverCommandPV - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["SRVFNC%1 = Compile PreprocessFile ""Server\PVFunctions\%1.sqf""",serverCommandPV Select _count,_count];};

clientCommandPVTimeLeft = [];
for [{_count = Count clientCommandPV - 1},{_count >= 0},{_count = _count - 1}] do {clientCommandPVTimeLeft = clientCommandPVTimeLeft + [0];};

advancedGame = false;

commonScriptsExecuted = commonScriptsExecuted + 1;