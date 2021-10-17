//WEST
_u			= ["MH6"];
_d			= [Localize "STR_DN_MH6"];
_c			= [2500];
_m			= [2500 + (westBarracksCosts Select WPILOTTYPE)];
_t			= [35];
_p			= [20];
_o			= [true];
_i			= ["\ca\air\data\ico\mh6_lb_CA.paa"];
_s 			= [false];

_u = _u		+ ["AH6"];
_d = _d		+ [Localize "STR_DN_AH6"];
_c = _c		+ [3500];
_m = _m		+ [3500 + (westBarracksCosts Select WPILOTTYPE)];
_t = _t		+ [40];
_p = _p		+ [30];
_o = _o		+ [true];
_i = _i		+ ["\ca\air\data\ico\ah6_lb_CA.paa"];
_s = _s		+ [false];

_u = _u		+ ["UH60MG"];
_d = _d		+ [Localize "STR_DN_UH60_MG"];
_c = _c		+ [3000];
_m = _m		+ [3000 + (westBarracksCosts Select WPILOTTYPE) * 2];
_t = _t		+ [40];
_p = _p		+ [25];
_o = _o		+ [false];
_i = _i		+ ["\ca\air\data\ico\uh_60mg_CA.paa"];
_s = _s		+ [false];

_u = _u		+ ["UH60"];
_d = _d		+ [Localize "STR_DN_UH60"];
_c = _c		+ [5000];
_m = _m		+ [5000 + (westBarracksCosts Select WPILOTTYPE)];
_t = _t		+ [45];
_p = _p		+ [40];
_o = _o		+ [true];
_i = _i		+ ["\ca\air\data\ico\uh_60_CA.paa"];
_s = _s		+ [true];

_u = _u		+ ["AH1W"];
_d = _d		+ [Localize "STR_DN_AH1Z"];
_c = _c		+ [8000];
_m = _m		+ [8000 + (westBarracksCosts Select WPILOTTYPE) * 2];
_t = _t		+ [55];
_p = _p		+ [50];
_o = _o		+ [false];
_i = _i		+ ["\ca\air\data\ico\ah1z_CA.paa"];
_s = _s		+ [true];

_u = _u		+ ["AV8B"];
_d = _d		+ [Localize "STR_DN_AV8B"];
_c = _c		+ [11000];
_m = _m		+ [11000 + (westBarracksCosts Select WPILOTTYPE)];
_t = _t		+ [45];
_p = _p		+ [45];
_o = _o		+ [true];
_i = _i 	+ ["\ca\air\data\ico\av8b_CA.paa"];
_s = _s		+ [true];

_u = _u		+ ["AV8B2"];
_d = _d		+ [Localize "STR_DN_AV8B2"];
_c = _c		+ [11500];
_m = _m		+ [11500 + (westBarracksCosts Select WPILOTTYPE)];
_t = _t		+ [45];
_p = _p		+ [45];
_o = _o		+ [true];
_i = _i		+ ["\ca\air\data\ico\av8b_CA.paa"];
_s = _s		+ [true];

_u = _u		+ ["A10"];
_d = _d		+ [Localize "STR_DN_A10"];
_c = _c		+ [12500];
_m = _m		+ [12500 + (westBarracksCosts Select WPILOTTYPE)];
_t = _t		+ [50];
_p = _p		+ [50];
_o = _o		+ [true];
_i = _i		+ ["\ca\A10\data\Picture_A10_CA.paa"];
_s = _s		+ [true];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_u Select _count,_count];};

westOneManAircraftVehicles = [];
for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {if (_o Select _count) then {westOneManAircraftVehicles = westOneManAircraftVehicles + [_count]};};

westAircraftUnits = _u;
westAircraftDescriptions = _d;
westAircraftCosts = _c;
westAircraftMannedCosts = _m;
westAircraftTimes = _t;
westAircraftPoints = _p;
westAircraftImages = _i;
westAircraftUpgrades = _s;

//EAST
_u			= ["MI17_MG"];
_d			= [Localize "STR_DN_MI17_MG"];
_c			= [3000];
_m			= [3000 + (eastBarracksCosts Select EPILOTTYPE) * 2];
_t			= [35];
_p			= [20];
_o			= [false];
_i			= ["\ca\air\data\ico\mi17_hip_mg_CA.paa"];
_s 			= [false];

_u = _u		+ ["MI17"];
_d = _d		+ [Localize "STR_DN_MI17"];
_c = _c		+ [5500];
_m = _m		+ [5500 + (eastBarracksCosts Select EPILOTTYPE)];
_t = _t		+ [45];
_p = _p		+ [40];
_o = _o		+ [true];
_i = _i		+ ["\ca\air\data\ico\mi17_HIP_CA.paa"];
_s = _s		+ [true];

_u = _u		+ ["SU34"];
_d = _d		+ [Localize "STR_DN_SU34"];
_c = _c		+ [11000];
_m = _m		+ [11000 + (westBarracksCosts Select WPILOTTYPE)];
_t = _t		+ [50];
_p = _p		+ [50];
_o = _o		+ [true];
_i = _i		+ ["\ca\air3\SU34\data\UI\Picture_su34_CA.paa"];
_s = _s 	+ [true];

_u = _u		+ ["SU34B"];
_d = _d		+ [Localize "STR_DN_SU34B"];
_c = _c		+ [11500];
_m = _m		+ [11500 + (westBarracksCosts Select WPILOTTYPE)];
_t = _t		+ [50];
_p = _p		+ [50];
_o = _o		+ [true];
_i = _i		+ ["\ca\air3\SU34\data\UI\Picture_su34_CA.paa"];
_s = _s 	+ [true];

_u = _u		+ ["SU34GBU"];
_d = _d		+ ["Su-34 (GBU)"];
_c = _c		+ [12000];
_m = _m		+ [12000 + (westBarracksCosts Select WPILOTTYPE)];
_t = _t		+ [60];
_p = _p		+ [60];
_o = _o		+ [true];
_i = _i		+ ["\ca\air3\SU34\data\UI\Picture_su34_CA.paa"];
_s = _s 	+ [true];

_u = _u		+ ["KA50"];
_d = _d		+ [Localize "STR_DN_KA50"];
_c = _c		+ [13000];
_m = _m		+ [13000 + (eastBarracksCosts Select EPILOTTYPE)];
_t = _t		+ [55];
_p = _p		+ [50];
_o = _o		+ [true];
_i = _i		+ ["\ca\air\data\ico\ka50_CA.paa"];
_s = _s		+ [true];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_u Select _count,_count];};

eastOneManAircraftVehicles = [];
for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {if (_o Select _count) then {eastOneManAircraftVehicles = eastOneManAircraftVehicles + [_count]};};

eastAircraftUnits = _u;
eastAircraftDescriptions = _d;
eastAircraftCosts = _c;
eastAircraftMannedCosts = _m;
eastAircraftTimes = _t;
eastAircraftPoints = _p;
eastAircraftImages = _i;
eastAircraftUpgrades = _s;

//RESISTANCE
resistanceAircraftUnits = [];
resistanceAircraftDescriptions = [];
resistanceAircraftCosts = [];
resistanceAircraftMannedCosts = [];
resistanceAircraftTimes = [];
resistanceAircraftPoints = [];
resistanceAircraftImages = [];

aircraftUnits = westAircraftUnits + eastAircraftUnits + resistanceAircraftUnits;
aircraftUnitCosts = westAircraftCosts + eastAircraftCosts + resistanceAircraftCosts;
aircraftUnitDescriptions = westAircraftDescriptions + eastAircraftDescriptions + resistanceAircraftDescriptions;

longestAircraftBuildTime = 0;
_t = eastAircraftTimes + westAircraftTimes + resistanceAircraftTimes;
for [{_count = Count _t - 1},{_count >= 0},{_count = _count - 1}] do {if (_t Select _count > longestAircraftBuildTime) then {longestAircraftBuildTime = _t Select _count};};