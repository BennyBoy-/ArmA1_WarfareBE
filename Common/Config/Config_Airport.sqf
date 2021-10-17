//WEST
_u			= ["AV8B"];
_d			= [Localize "STR_DN_AV8B"];
_c			= [9500];
_m			= [9500 + (westBarracksCosts Select WPILOTTYPE)];
_o			= [true];
_t			= [45];
_p			= [45];
_i			= ["\ca\air\data\ico\av8b_CA.paa"];
_s 			= [false];

_u = _u		+ ["AV8B2"];
_d = _d		+ [Localize "STR_DN_AV8B2"];
_c = _c		+ [9500];
_m = _m		+ [9500 + (westBarracksCosts Select WPILOTTYPE)];
_o = _o		+ [true];
_t = _t		+ [45];
_p = _p		+ [45];
_i = _i		+ ["\ca\air\data\ico\av8b_CA.paa"];
_s = _s		+ [true];

_u = _u		+ ["A10"];
_d = _d		+ [Localize "STR_DN_A10"];
_c = _c		+ [11000];
_m = _m		+ [11000 + (westBarracksCosts Select WPILOTTYPE)];
_o = _o		+ [true];
_t = _t		+ [50];
_p = _p		+ [50];
_i = _i		+ ["\ca\A10\data\Picture_A10_CA.paa"];
_s = _s		+ [true];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_u Select _count,_count];};

westOneManWingedAircraftVehicles = [];
for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {if (_o Select _count) then {westOneManWingedAircraftVehicles = westOneManWingedAircraftVehicles + [_count]};};

westWingedAircraftUnits = _u;
westWingedAircraftDescriptions = _d;
westWingedAircraftCosts = _c;
westWingedAircraftMannedCosts = _m;
westWingedAircraftTimes = _t;
westWingedAircraftPoints = _p;
westWingedAircraftImages = _i;
westWingedAircraftUpgrades = _s;

//EAST
_u			= ["SU34"];
_d			= [Localize "STR_DN_SU34"];
_c			= [9000];
_m			= [9000 + (westBarracksCosts Select WPILOTTYPE)];
_o			= [true];
_t			= [50];
_p			= [50];
_i			= ["\ca\air3\SU34\data\UI\Picture_su34_CA.paa"];
_s 			= [true];

_u = _u		+ ["SU34B"];
_d = _d		+ [Localize "STR_DN_SU34B"];
_c = _c		+ [9500];
_m = _m		+ [9500 + (westBarracksCosts Select WPILOTTYPE)];
_o = _o		+ [true];
_t = _t		+ [50];
_p = _p		+ [50];
_i = _i		+ ["\ca\air3\SU34\data\UI\Picture_su34_CA.paa"];
_s = _s 	+ [false];

_u = _u		+ ["SU34GBU"];
_d = _d		+ ["Su-34 (GBU)"];
_c = _c		+ [10000];
_m = _m		+ [10000 + (westBarracksCosts Select WPILOTTYPE)];
_o = _o		+ [true];
_t = _t		+ [60];
_p = _p		+ [60];
_i = _i		+ ["\ca\air3\SU34\data\UI\Picture_su34_CA.paa"];
_s = _s 	+ [false];

for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_u Select _count,_count];};

eastOneManWingedAircraftVehicles = [];
for [{_count = Count _u - 1},{_count >= 0},{_count = _count - 1}] do {if (_o Select _count) then {eastOneManWingedAircraftVehicles = eastOneManWingedAircraftVehicles + [_count]};};

eastWingedAircraftUnits = _u;
eastWingedAircraftDescriptions = _d;
eastWingedAircraftCosts = _c;
eastWingedAircraftMannedCosts = _m;
eastWingedAircraftTimes = _t;
eastWingedAircraftPoints = _p;
eastWingedAircraftImages = _i;
eastWingedAircraftUpgrades = _s;

//RESISTANCE
resistanceWingedAircraftUnits = [];
resistanceWingedAircraftDescriptions = [];
resistanceWingedAircraftCosts = [];
resistanceWingedAircraftMannedCosts = [];
resistanceWingedAircraftTimes = [];
resistanceWingedAircraftPoints = [];
resistanceWingedAircraftImages = [];

wingedAircraftUnits = westWingedAircraftUnits + eastWingedAircraftUnits + resistanceWingedAircraftUnits;
wingedAircraftUnitCosts = westWingedAircraftCosts + eastWingedAircraftCosts + resistanceWingedAircraftCosts;
wingedAircraftUnitDescriptions = westWingedAircraftDescriptions + eastWingedAircraftDescriptions + resistanceWingedAircraftDescriptions;

longestWingedAircraftBuildTime = 0;
_t = eastWingedAircraftTimes + westWingedAircraftTimes + resistanceWingedAircraftTimes;
for [{_count = Count _t - 1},{_count >= 0},{_count = _count - 1}] do {if (_t Select _count > longestWingedAircraftBuildTime) then {longestWingedAircraftBuildTime = _t Select _count};};