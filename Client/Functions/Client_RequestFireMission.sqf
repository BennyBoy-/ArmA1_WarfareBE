//Last modified 4/4/8

_destination = _this Select 0;

ScopeName "FireMission";

fireMissionInProgress = true;
//ToDo: Safety check, make sure no friendly units or buildings are there.

for [{_count1 = 0},{_count1 < 5},{_count1 = _count1 + 1}] do
{
	_units = [Group player,_destination,10000] Call GetTeamArtillery;
	if (!fireMissionInProgress || Count _units < 1) then {BreakTo "FireMission"};

	for [{_count = Count _units - 1},{_count >= 0},{_count = _count - 1}] do
	{
		[_units Select _count,_destination,Side player,fireMissionRadius,ArtyCurrentRound] Spawn FireArtillery;
	};

	Sleep 10;
};

Localize "STRWFCEASINGFIREMISSION" Call GroupChatMessage;

fireMissionInProgress = false;

//Keep weapons reloaded.
_units = [Group player,_destination,10000,true] Call GetTeamArtillery;
{if (!SomeAmmo _x) then {_x Call RearmVehicle};} ForEach _units;
