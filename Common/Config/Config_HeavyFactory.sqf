//WEST
_u			= ["Vulcan"];
_d			= [Localize "STR_DN_VULCAN"];
_c			= [1000];
_m			= [1000 + (westBarracksCosts Select WCREWTYPE) * 2];
_t			= [30];
_p			= [25];
_i			= ["\ca\tracked\Data\ico\m163_vulcan_CA.paa"];
_o			= [false];
_s 			= [false];

_u = _u		+ ["Stryker_ICV_M2"];
_d = _d		+ [Localize "STR_DN_STRYKER_M2"];
_c = _c		+ [1000];
_m = _m		+ [1000 + (westBarracksCosts Select WCREWTYPE) * 2];
_t = _t		+ [30];
_p = _p		+ [20];
_o = _o		+ [false];
_i = _i		+ ["\Ca\wheeled\data\ico\stryker_ICV_CA.paa"];
_s = _s		+ [false];

_u = _u		+ ["Stryker_ICV_MK19"];
_d = _d		+ [Localize "STR_DN_STRYKER_MK19"];
_c = _c		+ [1100];
_m = _m		+ [1100 + (westBarracksCosts Select WCREWTYPE) * 2];
_t = _t		+ [31];
_p = _p		+ [22];
_o = _o		+ [false];
_i = _i		+ ["\Ca\wheeled\data\ico\stryker_mk19_CA.paa"];
_s = _s		+ [false];

_u = _u		+ ["Stryker_TOW"];
_d = _d		+ [Localize "STR_DN_STRYKER_TOW"];
_c = _c		+ [1250];
_m = _m		+ [1250 + (westBarracksCosts Select WCREWTYPE) * 2];
_t = _t		+ [32];
_p = _p		+ [25];
_o = _o		+ [false];
_i = _i		+ ["\Ca\wheeled\data\ico\stryker_tow_CA.paa"];
_s = _s		+ [true];

_u = _u		+ ["M1Abrams"];
_d = _d		+ [Localize "STR_DN_M1A1"];
_c = _c		+ [3000];
_m = _m		+ [3000 + (westBarracksCosts Select WCREWTYPE) * 2];
_t = _t		+ [40];
_p = _p		+ [35];
_o = _o		+ [false];
_i = _i		+ ["\ca\tracked\Data\ico\M1_abrams_CA.paa"];
_s = _s		+ [true];

_u = _u		+ ["M1H"];
_d = _d		+ ["M1A1 (Howitzer)"];
_c = _c		+ [12000];
_m = _m		+ [12000 + (westBarracksCosts Select WCREWTYPE) * 2];
_t = _t		+ [60];
_p = _p		+ [65];
_o = _o		+ [false];
_i = _i		+ ["\ca\tracked\Data\ico\M1_abrams_CA.paa"];
_s = _s		+ [true];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_u Select _count,_count];};

westOneManHeavyVehicles = [];
for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {if (_o Select _count) then {westOneManHeavyVehicles = westOneManHeavyVehicles + [_count]};};

westHeavyUnits = _u;
westHeavyDescriptions = _d;
westHeavyCosts = _c;
westHeavyMannedCosts = _m;
westHeavyTimes = _t;
westHeavyPoints = _p;
westHeavyImages = _i;
westHeavyUpgrades = _s;

//EAST
_u			= ["ZSU"];
_d			= [Localize "STR_DN_ZSU"];
_c			= [1000];
_m			= [1000 + (eastBarracksCosts Select ECREWTYPE) * 2];
_t			= [30];
_p			= [25];
_o			= [false];
_i			= ["\ca\tracked\Data\ico\zsu_CA.paa"];
_s 			= [false];

_u = _u		+ ["BMP2"];
_d = _d		+ [Localize "STR_DN_BMP2"];
_c = _c		+ [1400];
_m = _m		+ [1400 + (eastBarracksCosts Select ECREWTYPE)];
_t = _t		+ [35];
_p = _p		+ [30];
_o = _o		+ [false];
_i = _i		+ ["\ca\tracked\Data\ico\bmp2_CA.paa"];
_s = _s		+ [false];

_u = _u		+ ["T72"];
_d = _d		+ [Localize "STR_DN_T72"];
_c = _c		+ [2800];
_m = _m		+ [2800 + (eastBarracksCosts Select ECREWTYPE) * 2];
_t = _t		+ [37];
_p = _p		+ [35];
_o = _o		+ [false];
_i = _i		+ ["\ca\tracked\Data\ico\t72_CA.paa"];
_s = _s		+ [true];

_u = _u		+ ["T72H"];
_d = _d		+ ["T-72 (Howitzer)"];
_c = _c		+ [15000];
_m = _m		+ [15000 + (eastBarracksCosts Select ECREWTYPE) * 2];
_t = _t		+ [80];
_p = _p		+ [65];
_o = _o		+ [false];
_i = _i		+ ["\ca\tracked\Data\ico\t72_CA.paa"];
_s = _s		+ [true];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_u Select _count,_count];};

eastOneManHeavyVehicles = [];
for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {if (_o Select _count) then {eastOneManHeavyVehicles = eastOneManHeavyVehicles + [_count]};};

eastHeavyUnits = _u;
eastHeavyDescriptions = _d;
eastHeavyCosts = _c;
eastHeavyMannedCosts = _m;
eastHeavyTimes = _t;
eastHeavyPoints = _p;
eastHeavyImages = _i;
eastHeavyUpgrades = _s;

//RESISTANCE
_u			= ["Vulcan_RACS"];
_d			= [Localize "STR_DN_VULCAN"];
_c			= [1000];
_m			= [1000 + (resistanceBarracksCosts Select GSOLDIERTYPE) * 2];
_t			= [30];
_p			= [25];
_i			= ["\ca\tracked\Data\ico\m163_vulcan_CA.paa"];
_o			= [false];

_u = _u		+ ["T72_RACS"];
_d = _d		+ ["T72 (RACS)"];
_c = _c		+ [2800];
_m = _m		+ [2800 + (resistanceBarracksCosts Select GSOLDIERTYPE) * 2];
_t = _t		+ [37];
_p = _p		+ [35];
_o = _o		+ [false];
_i = _i		+ ["\ca\tracked\Data\ico\t72_CA.paa"];

resistanceHeavyUnits = _u;
resistanceHeavyDescriptions = _d;
resistanceHeavyCosts = _c;
resistanceHeavyMannedCosts = _m;
resistanceHeavyTimes = _t;
resistanceHeavyPoints = _p;
resistanceHeavyImages = _i;

heavyUnits = westHeavyUnits + eastHeavyUnits + resistanceHeavyUnits;
heavyUnitCosts = westHeavyCosts + eastHeavyCosts + resistanceHeavyCosts;
heavyUnitDescriptions = westHeavyDescriptions + eastHeavyDescriptions + resistanceHeavyDescriptions;

longestHeavyBuildTime = 0;
_t = eastHeavyTimes + westHeavyTimes + resistanceHeavyTimes;
for [{_count = Count _t - 1},{_count >= 0},{_count = _count - 1}] do {if (_t Select _count > longestHeavyBuildTime) then {longestHeavyBuildTime = _t Select _count};};