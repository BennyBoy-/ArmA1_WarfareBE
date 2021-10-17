setviewdistance 1200;
TitleRsc["WF_Splash","PLAIN",0];
upgradetime = time;
//Mando Stuff
mando_hitch_no_check_for_drop = true;
//mando_hitch_types = ["LandVehicle","ship", "Air", "ReammoBox", "StaticWeapon"];
mando_hitch_types = ["Car","Motorcycle", "ship", "ReammoBox"];
mando_hitch_types_heavy = ["Tank","Air", "StaticWeapon"];
mando_hitch_heavies = ["UH60MG","UH60","Mi17_MG","Mi17"];
[12]execVM"mando_hitch\mando_hitch.sqf";
[["UH60MG","UH60","Mi17_MG","Mi17","MH6","AH6","KA50"]]execVM"mando_hitch\mando_add_hitch.sqf";
//[heli1]execVM"mando_hitch\mando_add_hitch.sqf";
