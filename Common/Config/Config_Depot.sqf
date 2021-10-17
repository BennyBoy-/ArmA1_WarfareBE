//WEST
_u			= ["Repair"];
_d			= ["Repair Team Vehicle(s)"];
_c			= [250];
_m			= [250];
_o			= [false];
_t			= [0];
_p			= [0];
_i			= [""];
_s 			= [false];

_u = _u		+ ["Rearm"];
_d = _d		+ ["Rearm Team Vehicle(s)"];
_c = _c		+ [250];
_m = _m		+ [250];
_o = _o		+ [false];
_t = _t		+ [0];
_p = _p		+ [0];
_i = _i		+ [""];
_s = _s		+ [false];

_u = _u		+ ["Refuel"];
_d = _d		+ ["Refuel Team Vehicle(s)"];
_c = _c		+ [100];
_m = _m		+ [100];
_o = _o		+ [false];
_t = _t		+ [0];
_p = _p		+ [0];
_i = _i		+ [""];
_s = _s		+ [false];

_u = _u		+ ["M1030"];
_d = _d		+ [Localize "STR_DN_M1030"];
_c = _c		+ [200];
_m = _m		+ [200];
_o = _o		+ [false];
_t = _t		+ [15];
_p = _p		+ [10];
_i = _i		+ ["\Ca\wheeled3\DATA\UI\picture_m1030_ca.paa"];
_s = _s		+ [false];

_u = _u		+ ["SkodaBlue"];
_d = _d		+ [Localize "STR_DN_SKODA_BLUE"];
_c = _c		+ [300];
_m = _m		+ [300];
_o = _o		+ [false];
_t = _t		+ [15];
_p = _p		+ [10];
_i = _i		+ ["\Ca\wheeled\data\ico\skodovka_blue_ca.paa"];
_s = _s		+ [false];

_u = _u		+ ["hilux1_civil_3_open"];
_d = _d		+ [Localize "STR_DN_HILUX3"];
_c = _c		+ [400];
_m = _m		+ [400];
_o = _o		+ [false];
_t = _t		+ [15];
_p = _p		+ [10];
_i = _i		+ ["\Ca\wheeled\data\ico\hilux1_civil_3_open_ca.paa"];
_s = _s		+ [false];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_u Select _count,_count];};

westOneManDepotVehicles = [];
for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {if (_o Select _count) then {westOneManDepotVehicles = westOneManDepotVehicles + [_count]};};

westDepotUnits = _u;
westDepotDescriptions = _d;
westDepotCosts = _c;
westDepotMannedCosts = _m;
westDepotTimes = _t;
westDepotPoints = _p;
westDepotImages = _i;
westDepotUpgrades = _s;

//EAST
_u			= ["Repair"];
_d			= ["Repair Team Vehicle(s)"];
_c			= [250];
_m			= [250];
_o			= [false];
_t			= [0];
_p			= [0];
_i			= [""];
_s 			= [false];

_u = _u		+ ["Rearm"];
_d = _d		+ ["Rearm Team Vehicle(s)"];
_c = _c		+ [250];
_m = _m		+ [250];
_o = _o		+ [false];
_t = _t		+ [0];
_p = _p		+ [0];
_i = _i		+ [""];
_s = _s		+ [false];

_u = _u		+ ["Refuel"];
_d = _d		+ ["Refuel Team Vehicle(s)"];
_c = _c		+ [100];
_m = _m		+ [100];
_o = _o		+ [false];
_t = _t		+ [0];
_p = _p		+ [0];
_i = _i		+ [""];
_s = _s		+ [false];

_u = _u		+ ["TT650G"];
_d = _d		+ [Localize "STR_DN_TT650G"];
_c = _c		+ [200];
_m = _m		+ [200];
_o = _o		+ [false];
_t = _t		+ [15];
_p = _p		+ [10];
_i = _i		+ ["\Ca\wheeled3\DATA\UI\picture_tt650_ca.paa"];
_s = _s		+ [false];

_u = _u		+ ["SkodaRed"];
_d = _d		+ [Localize "STR_DN_SKODA_RED"];
_c = _c		+ [300];
_m = _m		+ [300];
_o = _o		+ [false];
_t = _t		+ [15];
_p = _p		+ [10];
_i = _i		+ ["\Ca\wheeled\data\ico\skodovka_red_ca.paa"];
_s = _s		+ [false];

_u = _u		+ ["hilux1_civil_2_covered"];
_d = _d		+ [Localize "STR_DN_HILUX2"];
_c = _c		+ [400];
_m = _m		+ [400];
_o = _o		+ [false];
_t = _t		+ [15];
_p = _p		+ [10];
_i = _i		+ ["\Ca\wheeled\data\ico\hilux1_civil_2_covered_ca.paa"];
_s = _s		+ [false];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_u Select _count,_count];};

eastOneManDepotVehicles = [];
for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {if (_o Select _count) then {eastOneManDepotVehicles = eastOneManDepotVehicles + [_count]};};

eastDepotUnits = _u;
eastDepotDescriptions = _d;
eastDepotCosts = _c;
eastDepotMannedCosts = _m;
eastDepotTimes = _t;
eastDepotPoints = _p;
eastDepotImages = _i;
eastDepotUpgrades = _s;

//RESISTANCE
resistanceDepotUnits = [];
resistanceDepotDescriptions = [];
resistanceDepotCosts = [];
resistanceDepotMannedCosts = [];
resistanceDepotTimes = [];
resistanceDepotPoints = [];
resistanceDepotImages = [];

depotUnits = westDepotUnits + eastDepotUnits + resistanceDepotUnits;
depotUnitCosts = westDepotCosts + eastDepotCosts + resistanceDepotCosts;
depotUnitDescriptions = westDepotDescriptions + eastDepotDescriptions + resistanceDepotDescriptions;

longestDepotBuildTime = 0;
_t = eastDepotTimes + westDepotTimes + resistanceDepotTimes;
for [{_count = Count _t - 1},{_count >= 0},{_count = _count - 1}] do {if (_t Select _count > longestDepotBuildTime) then {longestDepotBuildTime = _t Select _count};};