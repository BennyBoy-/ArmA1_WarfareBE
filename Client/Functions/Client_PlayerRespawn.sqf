//Last modified 4/25/8
//Description: This is run when a player respawns.

Private["_count","_teams"];

for [{_count = 0},{_count < 5},{_count = _count + 1}] do {player RemoveAction _count};

player AddAction [Localize "STRWFOPTIONS","Client\Action\Action_OpenOptionsMenu.sqs",false,0,false,false,"TeamSwitch"];

[player,respawnWeapons,respawnAmmo] Call EquipLoadout;

[player,sideJoined] Call InitUnit;

[player]execVM "client\sharescore.sqf";
//1/22/7 MM - Created file.
