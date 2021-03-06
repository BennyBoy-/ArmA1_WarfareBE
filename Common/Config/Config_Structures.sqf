//WEST STRUCTURES
_v			= ["Headquarters"];
_n			= ["M113_MHQ_unfolded"];
_ng			= ["M113_MHQ_unfolded"];
_nr			= ["M113_MHQ_unfolded"];
_d			= [Localize "STRWFBHEADQUARTERS"];
_c			= [100];
_t			= [30];
_i			= ["\Warfare\Images\con_hq.paa"];
_p			= [100];
_s			= ["HQSite"];
_a			= ["Client\Action\Action_Headquarters.sqs"];
_dis		= [0];
_dir		= [0];
_h			= [3];

_v = _v		+ ["Barracks"];
_n = _n		+ ["WarfareBWestBarracks"];
_ng = _ng	+ ["WarfareBWestBarracksGreen"];
_nr = _nr	+ ["WarfareBWestBarracksRed"];
_d = _d		+ [Localize "STRWFBBARRACKS"];
_c = _c		+ [200];
_t = _t		+ [90];
_i = _i		+ ["\Warfare\Images\con_barracks.paa"];
_p = _p		+ [400];
_s = _s		+ ["SmallSite"];
_a = _a		+ ["Client\Action\Action_Barracks.sqs"];
_dis = _dis	+ [0];
_dir = _dir	+ [90];
_h = _h		+ [3];

_v = _v		+ ["Light"];
_n = _n		+ ["WarfareBWestLightFactory"];
_ng = _ng	+ ["WarfareBWestLightFactoryGreen"];
_nr = _nr	+ ["WarfareBWestLightFactoryRed"];
_d = _d		+ [Localize "STRWFBLIGHTFACTORY"];
_c = _c		+ [600];
_t = _t		+ [120];
_i = _i		+ ["\Warfare\Images\con_light.paa"];
_p = _p		+ [75];
_s = _s		+ ["SmallSite"];
_a = _a		+ ["Client\Action\Action_LightFactory.sqs"];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [4.5];

_v = _v		+ ["CommandCenter"];
_n = _n		+ ["WarfareBWestHeadquarters"];
_ng = _ng	+ ["WarfareBWestHeadquartersGreen"];
_nr = _nr	+ ["WarfareBWestHeadquartersRed"];
_d = _d		+ ["Command Center"];
_c = _c		+ [1500];
_t = _t		+ [180];
_i = _i		+ ["Client\Images\con_commandcenter.paa"];
_p = _p		+ [8];
_s = _s		+ ["MediumSite"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [180];
_h = _h		+ [5.5];

_v = _v		+ ["Heavy"];
_n = _n		+ ["WarfareBWestHeavyFactory"];
_ng = _ng	+ ["WarfareBWestHeavyFactoryGreen"];
_nr = _nr	+ ["WarfareBWestHeavyFactoryRed"];
_d = _d		+ [Localize "STRWFBHEAVYFACTORY"];
_c = _c		+ [2400];
_t = _t		+ [150];
_i = _i		+ ["\Warfare\Images\con_heavy.paa"];
_p = _p		+ [10];
_s = _s		+ ["MediumSite"];
_a = _a		+ ["Client\Action\Action_HeavyFactory.sqs"];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [4];

_v = _v		+ ["Aircraft"];
_n = _n		+ ["WarfareBWestAircraftFactory"];
_ng = _ng	+ ["WarfareBWestAircraftFactoryGreen"];
_nr = _nr	+ ["WarfareBWestAircraftFactoryRed"];
_d = _d		+ [Localize "STRWFBAIRCRAFTFACTORY"];
_c = _c		+ [4500];
_t = _t		+ [200];
_i = _i		+ ["\Warfare\Images\con_aircraft.paa"];
_p = _p		+ [8];
_s = _s		+ ["MediumSite"];
_a = _a		+ ["Client\Action\Action_AircraftFactory.sqs"];
_dis = _dis	+ [0];
_dir = _dir	+ [180];
_h = _h		+ [5.5];

for [{_count = Count _v - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["WEST%1TYPE = %2",_v Select _count,_count];};

WESTAIRPORTTYPE = Count _v;
WESTDEPOTTYPE = Count _v + 1;

westStructures = _v;
westStructureNames = _n;
westStructureGreenNames = _ng;
westStructureRedNames = _nr;
westStructureDescriptions = _d;
westStructureCosts = _c;
westStructureTimes = _t;
westStructureImages = _i;
westStructureChances = _p;
westStructureDistances = _dis;
westStructureDirections = _dir;
westStructureScripts = _s;
westStructureActions = _a;
westStructureHeights = _h;

//WEST STATIONARY DEFENSES
_v			= ["MGNest"];
_n			= ["WarfareBWestMGNest_M240"];
_ng			= ["WarfareBNestGreen"];
_nr			= ["WarfareBNestRed"];
_d			= [Localize "STRWFBWESTMGNEST"];
_c			= [200];
_t			= [0];
_i			= ["\Warfare\Images\con_mg_nest.paa"];
_h			= [0];
_p			= [25];
_s			= ["StationaryDefense"];
_a			= [""];
_dis		= [0];
_dir		= [0];
_h = _h		+ [0];

_v = _v		+ ["MK19"];
_n = _n		+ ["MK19_TriPod"];
_ng = _ng	+ ["MK19_TriPod"];
_nr = _nr	+ ["MK19_TriPod"];
_d = _d		+ ["MK19 Minitripod"];
_c = _c		+ [1200];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_gl.paa"];
_p = _p		+ [25];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["ATTripod"];
_n = _n		+ ["TOW_TriPod"];
_ng = _ng	+ ["TOW_TriPod"];
_nr = _nr	+ ["TOW_TriPod"];
_d = _d		+ ["TOW Tripod"];
_c = _c		+ [2000];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_at_pod.paa"];
_p = _p		+ [40];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["AATripod"];
_n = _n		+ ["Stinger_Pod"];
_ng = _ng	+ ["Stinger_Pod"];
_nr = _nr	+ ["Stinger_Pod"];
_d = _d		+ ["Stinger Tripod"];
_c = _c		+ [2000];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_aa_pod.paa"];
_p = _p		+ [40];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["M119"];
_n = _n		+ ["M119"];
_ng = _ng	+ ["M119"];
_nr = _nr	+ ["M119"];
_d = _d		+ [Localize "STR_DN_M119"];
_c = _c		+ [2500];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_gun.paa"];
_p = _p		+ [50];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["MediumWall"];
_n = _n		+ ["WarfareBWestHesco10x"];
_ng = _ng	+ ["WarfareBHesco10xGreen"];
_nr = _nr	+ ["WarfareBHesco10xRed"];
_d = _d		+ [Localize "STRWFBMEDIUMWALL"];
_c = _c		+ [2000];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_wall2.paa"];
_p = _p		+ [0];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["LargeWall"];
_n = _n		+ ["WarfareBWestHesco10xTall"];
_ng = _ng	+ ["WarfareBHesco10xTallGreen"];
_nr = _nr	+ ["WarfareBHesco10xTallRed"];
_d = _d		+ [Localize "STRWFBLARGEWALL"];
_c = _c		+ [2000];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_wall3.paa"];
_p = _p		+ [0];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dis	+ [0];
_h = _h		+ [0];

for [{_count = Count _v - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["WEST%1TYPE = %2",_v Select _count,_count];};

westDefenses = _v;
westDefenseNames = _n;
westDefenseGreenNames = _ng;
westDefenseRedNames = _nr;
westDefenseDescriptions = _d;
westDefenseCosts = _c;
westDefenseTimes = _t;
westDefenseImages = _i;
westDefenseChances = _p;
westDefenseDistances = _dis;
westDefenseDirections = _dir;
westDefenseScripts = _s;
westDefenseActions = _a;
westDefenseHeights = _h;

//EAST STRUCTURES
_v			= ["Headquarters"];
_n			= ["BMP2_MHQ_unfolded"];
_ng			= ["BMP2_MHQ_unfolded"];
_nr			= ["BMP2_MHQ_unfolded"];
_d			= [Localize "STRWFBHEADQUARTERS"];
_c			= [100];
_t			= [30];
_i			= ["\Warfare\Images\con_hq.paa"];
_p			= [100];
_s			= ["HQSite"];
_a			= ["Client\Action\Action_Headquarters.sqs"];
_dis		= [0];
_dir		= [0];
_h			= [3];

_v = _v		+ ["Barracks"];
_n = _n		+ ["WarfareBEastBarracks"];
_ng = _ng	+ ["WarfareBEastBarracksGreen"];
_nr = _nr	+ ["WarfareBEastBarracksRed"];
_d = _d		+ [Localize "STRWFBBARRACKS"];
_c = _c		+ [200];
_t = _t		+ [90];
_i = _i		+ ["\Warfare\Images\con_barracks.paa"];
_p = _p		+ [400];
_s = _s		+ ["SmallSite"];
_a = _a		+ ["Client\Action\Action_Barracks.sqs"];
_dis = _dis	+ [2];
_dir = _dir	+ [90];
_h = _h		+ [3];

_v = _v		+ ["Light"];
_n = _n		+ ["WarfareBEastLightFactory"];
_ng = _ng	+ ["WarfareBEastLightFactoryGreen"];
_nr = _nr	+ ["WarfareBEastLightFactoryRed"];
_d = _d		+ [Localize "STRWFBLIGHTFACTORY"];
_c = _c		+ [600];
_t = _t		+ [120];
_i = _i		+ ["\Warfare\Images\con_light.paa"];
_p = _p		+ [10];
_s = _s		+ ["SmallSite"];
_a = _a		+ ["Client\Action\Action_LightFactory.sqs"];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [4.5];

_v = _v		+ ["CommandCenter"];
_n = _n		+ ["WarfareBEastHeadquarters"];
_ng = _ng	+ ["WarfareBEastHeadquartersGreen"];
_nr = _nr	+ ["WarfareBWestHeadquartersRed"];
_d = _d		+ ["Command Center"];
_c = _c		+ [1500];
_t = _t		+ [180];
_i = _i		+ ["Client\Images\con_commandcenter.paa"];
_p = _p		+ [8];
_s = _s		+ ["MediumSite"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [180];
_h = _h		+ [5.5];

_v = _v		+ ["Heavy"];
_n = _n		+ ["WarfareBEastHeavyFactory"];
_ng = _ng	+ ["WarfareBEastHeavyFactoryGreen"];
_nr = _nr	+ ["WarfareBEastHeavyFactoryRed"];
_d = _d		+ [Localize "STRWFBHEAVYFACTORY"];
_c = _c		+ [2400];
_t = _t		+ [150];
_i = _i		+ ["\Warfare\Images\con_heavy.paa"];
_p = _p		+ [10];
_s = _s		+ ["MediumSite"];
_a = _a		+ ["Client\Action\Action_HeavyFactory.sqs"];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [4];

_v = _v		+ ["Aircraft"];
_n = _n		+ ["WarfareBEastAircraftFactory"];
_ng = _ng	+ ["WarfareBEastAircraftFactoryGreen"];
_nr = _nr	+ ["WarfareBEastAircraftFactoryRed"];
_d = _d		+ [Localize "STRWFBAIRCRAFTFACTORY"];
_c = _c		+ [4500];
_t = _t		+ [200];
_i = _i		+ ["\Warfare\Images\con_aircraft.paa"];
_p = _p		+ [8];
_s = _s		+ ["MediumSite"];
_a = _a		+ ["Client\Action\Action_AircraftFactory.sqs"];
_dis = _dis	+ [0];
_dir = _dir	+ [180];
_h = _h		+ [5.5];

for [{_count = Count _v - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["EAST%1TYPE = %2",_v Select _count,_count];};

EASTAIRPORTTYPE = Count _v;
EASTDEPOTTYPE = Count _v + 1;

eastStructures = _v;
eastStructureNames = _n;
eastStructureGreenNames = _ng;
eastStructureRedNames = _nr;
eastStructureDescriptions = _d;
eastStructureCosts = _c;
eastStructureTimes = _t;
eastStructureImages = _i;
eastStructureChances = _p;
eastStructureDistances = _dis;
eastStructureDirections = _dir;
eastStructureScripts = _s;
eastStructureActions = _a;
eastStructureHeights = _h;

//EAST STATIONARY DEFENSES
_v			= ["MGNest"];
_n			= ["WarfareBEastMGNest_PK"];
_ng			= ["WarfareBNestGreen"];
_nr			= ["WarfareBNestRed"];
_d			= [Localize "STRWFBEASTMGNEST"];
_c			= [200];
_t			= [0];
_i			= ["\Warfare\Images\con_mg_nest.paa"];
_p			= [25];
_s			= ["StationaryDefense"];
_a			= [""];
_dis		= [0];
_dir		= [0];
_h			= [0];

_v = _v		+ ["AGS30"];
_n = _n		+ ["AGS"];
_ng = _ng	+ ["AGS"];
_nr = _nr	+ ["AGS"];
_d = _d		+ [Localize "STR_DN_AGS30"];
_c = _c		+ [1200];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_gl.paa"];
_p = _p		+ [30];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["ATTripod"];
_n = _n		+ ["TOW_TriPod_East"];
_ng = _ng	+ ["TOW_TriPod_East"];
_nr = _nr	+ ["TOW_TriPod_East"];
_d = _d		+ ["AT Tripod"];
_c = _c		+ [2000];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_at_pod.paa"];
_p = _p		+ [40];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["AATripod"];
_n = _n		+ ["Stinger_Pod_East"];
_ng = _ng	+ ["Stinger_Pod_East"];
_nr = _nr	+ ["Stinger_Pod_East"];
_d = _d		+ ["AA Tripod"];
_c = _c		+ [2000];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_aa_pod.paa"];
_p = _p		+ [40];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["D30"];
_n = _n		+ ["D30"];
_ng = _ng	+ ["D30"];
_nr = _nr	+ ["D30"];
_d = _d		+ [Localize "STR_DN_D30"];
_c = _c		+ [2500];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_gun.paa"];
_p = _p		+ [50];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["MediumWall"];
_n = _n		+ ["WarfareBEastHesco10x"];
_ng = _ng	+ ["WarfareBHesco10xGreen"];
_nr = _nr	+ ["WarfareBHesco10xRed"];
_d = _d		+ [Localize "STRWFBMEDIUMWALL"];
_c = _c		+ [2000];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_wall2.paa"];
_p = _p		+ [0];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

_v = _v		+ ["LargeWall"];
_n = _n		+ ["WarfareBEastHesco10xTall"];
_ng = _ng	+ ["WarfareBHesco10xTallGreen"];
_nr = _nr	+ ["WarfareBHesco10xTallRed"];
_d = _d		+ [Localize "STRWFBLARGEWALL"];
_c = _c		+ [2000];
_t = _t		+ [0];
_i = _i		+ ["\Warfare\Images\con_wall3.paa"];
_p = _p		+ [0];
_s = _s		+ ["StationaryDefense"];
_a = _a		+ [""];
_dis = _dis	+ [0];
_dir = _dir	+ [0];
_h = _h		+ [0];

for [{_count = Count _v - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["EAST%1TYPE = %2",_v Select _count,_count];};

eastDefenses = _v;
eastDefenseNames = _n;
eastDefenseGreenNames = _ng;
eastDefenseRedNames = _nr;
eastDefenseDescriptions = _d;
eastDefenseCosts = _c;
eastDefenseTimes = _t;
eastDefenseImages = _i;
eastDefenseChances = _p;
eastDefenseDistances = _dis;
eastDefenseDirections = _dir;
eastDefenseScripts = _s;
eastDefenseActions = _a;
eastDefenseHeights = _h;

commonScriptsExecuted = commonScriptsExecuted + 1;