//WEST
_v			= ["WSOLDIER"];
_u			= ["USMCD_Soldier_R"];
_d			= [Localize "STR_DN_RIFLEMAN"];
_c			= [100];
_t			= [5];
_p			= [5];
_i			= ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s 			= [false];

_v = _v		+ ["WATSOLDIER"];
_u = _u		+ ["USMCD_Soldier_AT"];
_d = _d		+ [Localize "STR_DN_AT_SOLDIER"];
_c = _c		+ [200];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["WAASOLDIER"];
_u = _u		+ ["USMCD_Soldier_AA"];
_d = _d		+ [Localize "STR_DN_AA_SOLDIER"];
_c = _c		+ [200];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["WMGSOLDIER"];
_u = _u		+ ["USMCD_Soldier_MG"];
_d = _d		+ [Localize "STR_DN_MGUNNER"];
_c = _c		+ [150];
_t = _t		+ [6];
_p = _p		+ [6];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

_v = _v		+ ["WGSOLDIER"];
_u = _u		+ ["USMCD_Soldier_GL"];
_d = _d		+ [Localize "STR_DN_GRENADIER"];
_c = _c		+ [150];
_t = _t		+ [6];
_p = _p		+ [6];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

_v = _v		+ ["WSNIPER"];
_u = _u		+ ["USMCD_Soldier_Sniper"];
_d = _d		+ [Localize "STR_DN_SNIPER"];
_c = _c		+ [175];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["WMEDIC"];
_u = _u		+ ["USMCD_Soldier_Med"];
_d = _d		+ [Localize "STR_DN_MEDIC"];
_c = _c		+ [125];
_t = _t		+ [5];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

_v = _v		+ ["WENGINEER"];
_u = _u		+ ["USMCD_Soldier_Engineer"];
_d = _d		+ [Localize "STR_DN_ENGINEER"];
_c = _c		+ [125];
_t = _t		+ [7];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["WSPECOP"];
_u = _u		+ ["SoldierWSaboteur"];
_d = _d		+ [Localize "STR_DN_BLACKOP"];
_c = _c		+ [200];
_t = _t		+ [8];
_p = _p		+ [10];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["WSPECOPSNIPER"];
_u = _u		+ ["SoldierWSaboteurMarksman"];
_d = _d		+ [Localize "STR_DN_BLACKOP_SNIPER"];
_c = _c		+ [200];
_t = _t		+ [8];
_p = _p		+ [10];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["WCREW"];
_u = _u		+ ["SoldierWCrew"];
_d = _d		+ [Localize "STR_DN_CREW"];
_c = _c		+ [75];
_t = _t		+ [5];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

_v = _v		+ ["WPILOT"];
_u = _u		+ ["SoldierWPilot"];
_d = _d		+ [Localize "STR_DN_PILOT"];
_c = _c		+ [75];
_t = _t		+ [5];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2;%1 = ""%3""",_v Select _count,_count,_u Select _count];};

westBarracksNames = _v;
westBarracksUnits = _u;
westBarracksDescriptions = _d;
westBarracksCosts = _c;
westBarracksMannedCosts = _c;
westBarracksTimes = _t;
westBarracksPoints = _p;
westBarracksImages = _i;
westBarracksUpgrades = _s;

westOneManBarracksVehicles = [];

//EAST
_v			= ["ESOLDIER"];
_u			= ["SoldierEB"];
_d			= [Localize "STR_DN_RIFLEMAN"];
_c			= [100];
_t			= [5];
_p			= [5];
_i			= ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s 			= [false];

_v = _v		+ ["EATSOLDIER"];
_u = _u		+ ["SoldierEAT"];
_d = _d		+ [Localize "STR_DN_AT_SOLDIER"];
_c = _c		+ [200];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["EAASOLDIER"];
_u = _u		+ ["SoldierEAA"];
_d = _d		+ [Localize "STR_DN_AA_SOLDIER"];
_c = _c		+ [200];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["EMGSOLDIER"];
_u = _u		+ ["SoldierEMG"];
_d = _d		+ [Localize "STR_DN_MGUNNER"];
_c = _c		+ [150];
_t = _t		+ [6];
_p = _p		+ [6];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

_v = _v		+ ["EGSOLDIER"];
_u = _u		+ ["SoldierEG"];
_d = _d		+ [Localize "STR_DN_GRENADIER"];
_c = _c		+ [150];
_t = _t		+ [6];
_p = _p		+ [6];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

_v = _v		+ ["ESNIPER"];
_u = _u		+ ["SoldierESniper"];
_d = _d		+ [Localize "STR_DN_SNIPER"];
_c = _c		+ [175];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["EMEDIC"];
_u = _u		+ ["SoldierEMedic"];
_d = _d		+ [Localize "STR_DN_MEDIC"];
_c = _c		+ [125];
_t = _t		+ [5];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

_v = _v		+ ["EENGINEER"];
_u = _u		+ ["SoldierEMiner"];
_d = _d		+ [Localize "STR_DN_ENGINEER"];
_c = _c		+ [125];
_t = _t		+ [7];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["ESPECOP"];
_u = _u		+ ["SoldierESaboteur"];
_d = _d		+ [Localize "STR_DN_SPECNAZ"];
_c = _c		+ [200];
_t = _t		+ [8];
_p = _p		+ [10];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["ESPECOPSNIPER"];
_u = _u		+ ["SoldierESaboteurMarksman"];
_d = _d		+ [Localize "STR_DN_SPECNAZ_SNIPER"];
_c = _c		+ [200];
_t = _t		+ [8];
_p = _p		+ [10];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [true];

_v = _v		+ ["ECREW"];
_u = _u		+ ["SoldierECrew"];
_d = _d		+ [Localize "STR_DN_CREW"];
_c = _c		+ [75];
_t = _t		+ [5];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

_v = _v		+ ["EPILOT"];
_u = _u		+ ["SoldierEPilot"];
_d = _d		+ [Localize "STR_DN_PILOT"];
_c = _c		+ [75];
_t = _t		+ [5];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];
_s = _s		+ [false];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2;%1 = ""%3""",_v Select _count,_count,_u Select _count];};

eastBarracksNames = _v;
eastBarracksUnits = _u;
eastBarracksDescriptions = _d;
eastBarracksCosts = _c;
eastBarracksMannedCosts = _c;
eastBarracksTimes = _t;
eastBarracksPoints = _p;
eastBarracksImages = _i;
eastBarracksUpgrades = _s;

eastOneManBarracksVehicles = [];

//RESISTANCE
_v			= ["GSOLDIER"];
_u			= ["SoldierGB"];
_d			= [Localize "STR_DN_RIFLEMAN"];
_c			= [100];
_t			= [5];
_p			= [5];
_i			= ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GLEADER"];
_u = _u		+ ["SquadLeaderG"];
_d = _d		+ [Localize "STR_DN_SQUADLEADER"];
_c = _c		+ [200];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GATSOLDIER"];
_u = _u		+ ["SoldierGAT"];
_d = _d		+ [Localize "STR_DN_AT_SOLDIER"];
_c = _c		+ [200];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GAASOLDIER"];
_u = _u		+ ["SoldierGAA"];
_d = _d		+ [Localize "STR_DN_AA_SOLDIER"];
_c = _c		+ [200];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GMGSOLDIER"];
_u = _u		+ ["SoldierGMG"];
_d = _d		+ [Localize "STR_DN_MGUNNER"];
_c = _c		+ [150];
_t = _t		+ [6];
_p = _p		+ [6];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GGSOLDIER"];
_u = _u		+ ["SoldierGG"];
_d = _d		+ [Localize "STR_DN_GRENADIER"];
_c = _c		+ [150];
_t = _t		+ [6];
_p = _p		+ [6];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GSNIPER"];
_u = _u		+ ["SoldierGSniper"];
_d = _d		+ [Localize "STR_DN_SNIPER"];
_c = _c		+ [175];
_t = _t		+ [7];
_p = _p		+ [7];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GMEDIC"];
_u = _u		+ ["SoldierGMedic"];
_d = _d		+ [Localize "STR_DN_MEDIC"];
_c = _c		+ [125];
_t = _t		+ [5];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GENGINEER"];
_u = _u		+ ["SoldierGMiner"];
_d = _d		+ [Localize "STR_DN_ENGINEER"];
_c = _c		+ [125];
_t = _t		+ [7];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GSPECOP"];
_u = _u		+ ["SoldierGCommando"];
_d = _d		+ [Localize "STR_DN_ROYAL_COMMANDO"];
_c = _c		+ [200];
_t = _t		+ [8];
_p = _p		+ [10];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GMARKSMAN"];
_u = _u		+ ["SoldierGMarksman"];
_d = _d		+ [Localize "STR_DN_ROYAL_MARKSMAN"];
_c = _c		+ [220];
_t = _t		+ [8];
_p = _p		+ [10];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GGUARD"];
_u = _u		+ ["SoldierGGuard"];
_d = _d		+ [Localize "STR_DN_ROYAL_GUARD"];
_c = _c		+ [250];
_t = _t		+ [8];
_p = _p		+ [10];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GCREW"];
_u = _u		+ ["SoldierGCrew"];
_d = _d		+ [Localize "STR_DN_CREW"];
_c = _c		+ [75];
_t = _t		+ [5];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

_v = _v		+ ["GPILOT"];
_u = _u		+ ["SoldierGPilot"];
_d = _d		+ [Localize "STR_DN_PILOT"];
_c = _c		+ [75];
_t = _t		+ [5];
_p = _p		+ [5];
_i = _i		+ ["\Ca\characters\data\Ico\i_null_CA.paa"];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2;%1 = ""%3""",_v Select _count,_count,_u Select _count];};

resistanceBarracksNames = _v;
resistanceBarracksUnits = _u;
resistanceBarracksDescriptions = _d;
resistanceBarracksCosts = _c;
resistanceBarracksMannedCosts = _c;
resistanceBarracksTimes = _t;
resistanceBarracksPoints = _p;
resistanceBarracksImages = _i;

resistanceOneManBarracksVehicles = [];

westSoldierBaseClass = "SoldierWB";
eastSoldierBaseClass = "SoldierEB";
resistanceSoldierBaseClass = "SoldierGB";

soldierUnits = westBarracksUnits + eastBarracksUnits + resistanceBarracksUnits;
soldierUnitCosts = westBarracksCosts + eastBarracksCosts + resistanceBarracksCosts;
soldierUnitDescriptions = westBarracksDescriptions + eastBarracksDescriptions + resistanceBarracksDescriptions;

longestBarracksBuildTime = 0;
_t = eastBarracksTimes + westBarracksTimes + resistanceBarracksTimes;
for [{_count = Count _t - 1},{_count >= 0},{_count = _count - 1}] do {if (_t Select _count > longestBarracksBuildTime) then {longestBarracksBuildTime = _t Select _count};};

commonScriptsExecuted = commonScriptsExecuted + 1;