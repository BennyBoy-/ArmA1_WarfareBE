customTemplate = 0;
customWeapons = [0,0,0,0,0];
customMisc = [0,0,0,0,0,0,0,0,0,0,0,0];

//WEST LOADOUTS
_w			= [""];
_n			= [Localize "STRWFNONE"];
_c			= [0];
_i			= [""];
_a			= [""];
_ac			= [0];
_as			= [0];
_ai			= [""];
_an			= [""];

_weapon		= "M16A2";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [20];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "M16A2GL";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [30];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "m16a4";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [30];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "m16a4_acg";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [35];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "M16A4_GL";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [40];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "M16A4_ACG_GL";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [45];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "M4A1";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [40];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "M4AIM";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [45];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "M4A1GL";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [50];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "M4SPR";
_ammo		= "30Rnd_556x45_Stanag";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [55];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "M4A1SD";
_ammo		= "30Rnd_556x45_StanagSD";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [90];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [10];

_weapon		= "G36A";
_ammo		= "30Rnd_556x45_G36";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [60];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "G36C";
_ammo		= "30Rnd_556x45_G36";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [55];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "G36K";
_ammo		= "30Rnd_556x45_G36";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [50];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "MP5A5";
_ammo		= "30Rnd_9x19_MP5";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [30];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "MP5SD";
_ammo		= "30Rnd_9x19_MP5SD";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [90];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [10];

_weapon		= "M24";
_ammo		= "5Rnd_762x51_M24";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [90];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [7];

_weapon		= "m107";
_ammo		= "10Rnd_127x99_m107";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [150];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [15];

_weapon		= "M249";
_ammo		= "200Rnd_556x45_M249";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [55];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [15];

_weapon		= "M240";
_ammo		= "100Rnd_762x51_M240";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [65];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [15];

for [{_count = Count _w - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_w Select _count,_count];};

westPrimaryWeapons = _w;
westPrimaryNames = _n;
westPrimaryCosts = _c;
westPrimaryImages = _i;
westPrimaryAmmo = _a;
westPrimaryAmmoNames = _an;
westPrimaryAmmoCosts = _ac;
westPrimaryAmmoSpaces = _as;
westPrimaryAmmoImages = _ai;

_w			= [""];
_n			= [Localize "STRWFNONE"];
_c			= [0];
_i			= [""];
_a			= [""];
_ac			= [0];
_as			= [0];
_ai			= [""];
_an			= [""];

_weapon		= "M136";
_ammo		= "M136";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [150];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [45];

_weapon		= "Stinger";
_ammo		= "Stinger";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [200];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [100];

_weapon		= "Laserdesignator";
_ammo		= "Laserbatteries";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [350];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [100];

for [{_count = Count _w - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_w Select _count,_count];};

westSecondaryWeapons = _w;
westSecondaryNames = _n;
westSecondaryCosts = _c;
westSecondaryImages = _i;
westSecondaryAmmo = _a;
westSecondaryAmmoNames = _an;
westSecondaryAmmoCosts = _ac;
westSecondaryAmmoSpaces = _as;
westSecondaryAmmoImages = _ai;

_w			= [""];
_n			= [Localize "STRWFNONE"];
_c			= [0];
_i			= [""];
_a			= [""];
_ac			= [0];
_ai			= [""];
_an			= [""];

_weapon		= "M9";
_ammo		= "15Rnd_9x19_M9";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [15];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_ac = _ac	+ [2];

_weapon		= "M9SD";
_ammo		= "15Rnd_9x19_M9SD";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [20];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_ac = _ac	+ [3];

for [{_count = Count _w - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_w Select _count,_count];};

westSidearms = _w;
westSidearmNames = _n;
westSidearmCosts = _c;
westSidearmImages = _i;
westSidearmAmmo = _a;
westSidearmAmmoNames = _an;
westSidearmAmmoCosts = _ac;
westSidearmAmmoImages = _ai;

_w			= [""];
_n			= [Localize "STRWFNONE"];
_c			= [0];
_i			= [""];
_s			= [0];
_is			= [false];

_weapon		= "HandGrenade";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [false];

_weapon		= "FlareWhite_M203";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_weapon		= "FlareYellow_M203";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_weapon		= "FlareGreen_M203";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_weapon		= "FlareRed_M203";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_w = _w		+ ["Rnd_HE_M203"];
_workaround = Count _w - 1;

_weapon		= "1Rnd_HE_M203";
_c = _c		+ [5];
_is = _is	+ [true];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];

_weapon		= "SmokeShell";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_weapon		= "Mine";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [15];
_is = _is	+ [false];

_weapon		= "PipeBomb";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [15];
_is = _is	+ [false];

for [{_count = Count _w - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_w Select _count,_count];};

_w Set [_workaround,"1Rnd_HE_M203"];

westMiscWeapons = _w;
westMiscNames = _n;
westMiscCosts = _c;
westMiscImages = _i;
westMiscSpaces = _s;
westMiscIsSidearmAmmo = _is;

miscEquipment = ["Binocular","NVGoggles"];
miscEquipmentNames = [Localize "STR_DN_BINOCULAR",Localize "STR_DN_NV_GOGGLES"];
miscEquipmentImages = ["\dtaExt\equip\w\w_binocular","\dtaExt\equip\w\w_nvgoggles"];
miscEquipmentCosts = [5,15];

_n			= [Localize "STRWFCUSTOM"];
_p			= [0];
_pa			= [0];
_s			= [0];
_sa			= [0];
_si			= [0];
_m			= [0];
_ma			= [0];
_m1			= [0];
_ma1		= [0];

_n	= _n	+ [Format["%1/%2",westPrimaryNames Select M16A4TYPE,westSecondaryNames Select M136TYPE]];
_p	= _p	+ [M16A4TYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [M136TYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [M9TYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",westPrimaryNames Select m16a4_acgTYPE,westSecondaryNames Select M136TYPE]];
_p	= _p	+ [m16a4_acgTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [M136TYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [M9TYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",westPrimaryNames Select M16A4_ACG_GLTYPE,westSecondaryNames Select M136TYPE]];
_p	= _p	+ [M16A4_ACG_GLTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [M136TYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [0];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [Rnd_HE_M203TYPE];
_ma1= _ma1	+ [8];

_n	= _n	+ [Format["%1/%2",westPrimaryNames Select M4A1GLTYPE,westSecondaryNames Select M136TYPE]];
_p	= _p	+ [M4A1GLTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [M136TYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [0];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [Rnd_HE_M203TYPE];
_ma1= _ma1	+ [8];

_n	= _n	+ [Format["%1/%2",westPrimaryNames Select G36ATYPE,westSecondaryNames Select M136TYPE]];
_p	= _p	+ [G36ATYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [M136TYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [M9SDTYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",westPrimaryNames Select M4SPRTYPE,westSecondaryNames Select M136TYPE]];
_p	= _p	+ [M4SPRTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [M136TYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [M9SDTYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",westPrimaryNames Select MP5SDTYPE,westSecondaryNames Select M136TYPE]];
_p	= _p	+ [MP5SDTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [M136TYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [M9SDTYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",westPrimaryNames Select M4A1SDTYPE,westSecondaryNames Select M136TYPE]];
_p	= _p	+ [M4A1SDTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [M136TYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [M9SDTYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ ["M4A1 QDS CompM2 / Pipebombs"];
_p	= _p	+ [M4A1SDTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [0];
_sa	= _sa	+ [0];
_si	= _si	+ [M9SDTYPE];
_m	= _m	+ [PipeBombTYPE];
_ma	= _ma	+ [3];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Localize "STR_DN_M249"];
_p	= _p	+ [M249TYPE];
_pa	= _pa	+ [4];
_s	= _s	+ [0];
_sa	= _sa	+ [0];
_si	= _si	+ [M9SDTYPE];
_m	= _m	+ [HANDGRENADETYPE];
_ma	= _ma	+ [4];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Localize "STR_DN_M240"];
_p	= _p	+ [M240TYPE];
_pa	= _pa	+ [4];
_s	= _s	+ [0];
_sa	= _sa	+ [0];
_si	= _si	+ [M9SDTYPE];
_m	= _m	+ [HANDGRENADETYPE];
_ma	= _ma	+ [4];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",westPrimaryNames Select M24TYPE,westSecondaryNames Select M136TYPE]];
_p	= _p	+ [M24TYPE];
_pa	= _pa	+ [8];
_s	= _s	+ [M136TYPE];
_sa	= _sa	+ [2];
_si	= _si	+ [M9SDTYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Localize "STR_DN_M107"];
_p	= _p	+ [M107TYPE];
_pa	= _pa	+ [10];
_s	= _s	+ [0];
_sa	= _sa	+ [0];
_si	= _si	+ [M9SDTYPE];
_m	= _m	+ [HANDGRENADETYPE];
_ma	= _ma	+ [2];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_c = [];
_count = 0;
_totalTemplates = Count _n;

	while {_count < _totalTemplates} do {
	_cost = (westPrimaryCosts Select (_p Select _count)) + (westSecondaryCosts Select (_s Select _count)) + (westSidearmCosts Select (_si Select _count));
	_cost = _cost + ((westPrimaryAmmoCosts Select (_p Select _count)) * (_pa Select _count));
	_cost = _cost + ((westSecondaryAmmoCosts Select (_s Select _count)) * (_sa Select _count));
	_cost = _cost + (((westMiscCosts Select (_m  Select _count)) * (_ma Select _count)) + ((westMiscCosts Select (_m1 Select _count)) * (_ma1 Select _count)));
	_c = _c + [_cost];
	_count = _count + 1;
	};

westTemplateNames = _n;
westTemplatePrimary = _p;
westTemplatePrimaryAmmo = _pa;
westTemplateSecondary = _s;
westTemplateSecondaryAmmo = _sa;
westTemplateSidearms = _si;
westTemplateMisc = _m;
westTemplateAmount = _ma;
westTemplateMisc1 = _m1;
westTemplateAmount1 = _ma1;
westTemplateCosts = _c;

westDefaultWeapons = [westPrimaryWeapons Select M16A2TYPE];
westDefaultAmmo = [westPrimaryAmmo Select M16A2TYPE,westPrimaryAmmo Select M16A2TYPE,westPrimaryAmmo Select M16A2TYPE,westPrimaryAmmo Select M16A2TYPE,westMiscWeapons Select HANDGRENADETYPE,westMiscWeapons Select HANDGRENADETYPE,westMiscWeapons Select HANDGRENADETYPE,westMiscWeapons Select HANDGRENADETYPE];

//EAST LOADOUTS

_w			= [""];
_n			= [Localize "STRWFNONE"];
_c			= [0];
_i			= [""];
_a			= [""];
_ac			= [0];
_as			= [0];
_ai			= [""];
_an			= [""];

_weapon		= "AK74";
_ammo		= "30Rnd_545x39_AK";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [20];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "AKS74UN";
_ammo		= "30Rnd_545x39_AK";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [20];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "AK74GL";
_ammo		= "30Rnd_545x39_AK";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [30];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "AKS74U";
_ammo		= "30Rnd_545x39_AKSD";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [45];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [8];

_weapon		= "aks74pso";
_ammo		= "30Rnd_545x39_AK";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [35];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [5];

_weapon		= "PK";
_ammo		= "100Rnd_762x54_PK";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [50];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [15];

_weapon		= "SVD";
_ammo		= "10Rnd_762x54_SVD";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [85];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [8];

_weapon		= "ksvk";
_ammo		= "5Rnd_127x108_KSVK";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [160];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [10];

for [{_count = Count _w - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_w Select _count,_count];};

eastPrimaryWeapons = _w;
eastPrimaryNames = _n;
eastPrimaryCosts = _c;
eastPrimaryImages = _i;
eastPrimaryAmmo = _a;
eastPrimaryAmmoNames = _an;
eastPrimaryAmmoCosts = _ac;
eastPrimaryAmmoSpaces = _as;
eastPrimaryAmmoImages = _ai;

_w			= [""];
_n			= [Localize "STRWFNONE"];
_c			= [0];
_i			= [""];
_a			= [""];
_ac			= [0];
_as			= [0];
_ai			= [""];
_an			= [""];

_weapon		= "RPG7V";
_ammo		= "PG7V";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [150];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [40];

_weapon		= "Strela";
_ammo		= "Strela";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [200];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [100];

_weapon		= "Laserdesignator";
_ammo		= "Laserbatteries";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [350];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [100];

_ammo		= "PG7VR";
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_as = _as	+ [GetNumber (configFile >> "CfgMagazines" >> _ammo >> "type") / 256];
_ac = _ac	+ [60];

for [{_count = Count _w - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_w Select _count,_count];};

eastSecondaryWeapons = _w;
eastSecondaryNames = _n;
eastSecondaryCosts = _c;
eastSecondaryImages = _i;
eastSecondaryAmmo = _a;
eastSecondaryAmmoNames = _an;
eastSecondaryAmmoCosts = _ac;
eastSecondaryAmmoSpaces = _as;
eastSecondaryAmmoImages = _ai;

_w			= [""];
_n			= [Localize "STRWFNONE"];
_c			= [0];
_i			= [""];
_a			= [""];
_ac			= [0];
_ai			= [""];
_an			= [""];

_weapon		= "Makarov";
_ammo		= "8Rnd_9x18_Makarov";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [15];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_ac = _ac	+ [2];

_weapon		= "MakarovSD";
_ammo		= "8Rnd_9x18_MakarovSD";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgWeapons" >> _weapon >> "picture")];
_c = _c		+ [20];
_a = _a		+ [_ammo];
_an = _an	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "displayName")];
_ai = _ai	+ [GetText (configFile >> "CfgMagazines" >> _ammo >> "picture")];
_ac = _ac	+ [3];

for [{_count = Count _w - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_w Select _count,_count];};

eastSidearms = _w;
eastSidearmNames = _n;
eastSidearmCosts = _c;
eastSidearmImages = _i;
eastSidearmAmmo = _a;
eastSidearmAmmoNames = _an;
eastSidearmAmmoCosts = _ac;
eastSidearmAmmoImages = _ai;

_w			= [""];
_n			= [Localize "STRWFNONE"];
_c			= [0];
_i			= [""];
_s			= [0];
_is			= [false];

_weapon		= "HandGrenade";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [false];

_weapon		= "FlareWhite_GP25";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_weapon		= "FlareYellow_GP25";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_weapon		= "FlareGreen_GP25";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_weapon		= "FlareRed_GP25";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_w = _w		+ ["Rnd_HE_GP25"];
_workaround = Count _w - 1;

_weapon		= "1Rnd_HE_GP25";
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_weapon		= "SmokeShell";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [5];
_is = _is	+ [true];

_weapon		= "MineE";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [20];
_is = _is	+ [false];

_weapon		= "PipeBomb";
_w = _w		+ [_weapon];
_n = _n		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "displayName")];
_i = _i		+ [GetText (configFile >> "CfgMagazines" >> _weapon >> "picture")];
_s = _s		+ [GetNumber (configFile >> "CfgMagazines" >> _weapon >> "type") / 256];
_c = _c		+ [20];
_is = _is	+ [false];

for [{_count = Count _w - 1},{_count >= 0},{_count = _count - 1}] do {Call Compile Format["%1TYPE = %2",_w Select _count,_count];};

_w Set [_workaround,"1Rnd_HE_GP25"];

eastMiscWeapons = _w;
eastMiscNames = _n;
eastMiscCosts = _c;
eastMiscImages = _i;
eastMiscSpaces = _s;
eastMiscIsSidearmAmmo = _is;

_n			= [Localize "STRWFCUSTOM"];
_p			= [0];
_pa			= [0];
_s			= [0];
_sa			= [0];
_si			= [0];
_m			= [0];
_ma			= [0];
_m1			= [0];
_ma1		= [0];

_n	= _n	+ [Format["%1/%2",eastPrimaryNames Select AKS74PSOTYPE,eastSecondaryNames Select RPG7VTYPE]];
_p	= _p	+ [AKS74PSOTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [RPG7VTYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [MAKAROVSDTYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",eastPrimaryNames Select AKS74UTYPE,eastSecondaryNames Select RPG7VTYPE]];
_p	= _p	+ [AKS74UTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [RPG7VTYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [MAKAROVSDTYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",eastPrimaryNames Select AKS74UNTYPE,eastSecondaryNames Select RPG7VTYPE]];
_p	= _p	+ [AKS74UNTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [RPG7VTYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [MAKAROVSDTYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ ["AKS-74UN / Pipebombs"];
_p	= _p	+ [AKS74UNTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [0];
_sa	= _sa	+ [0];
_si	= _si	+ [MAKAROVSDTYPE];
_m	= _m	+ [PipeBombTYPE];
_ma	= _ma	+ [3];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",eastPrimaryNames Select AK74GLTYPE,eastSecondaryNames Select RPG7VTYPE]];
_p	= _p	+ [AK74GLTYPE];
_pa	= _pa	+ [6];
_s	= _s	+ [RPG7VTYPE];
_sa	= _sa	+ [3];
_si	= _si	+ [0];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [Rnd_HE_GP25TYPE];
_ma1= _ma1	+ [8];

_n	= _n	+ [Localize "STR_DN_PK"];
_p	= _p	+ [PKTYPE];
_pa	= _pa	+ [4];
_s	= _s	+ [0];
_sa	= _sa	+ [0];
_si	= _si	+ [MAKAROVSDTYPE];
_m	= _m	+ [HANDGRENADETYPE];
_ma	= _ma	+ [4];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Format["%1/%2",eastPrimaryNames Select SVDTYPE,eastSecondaryNames Select RPG7VTYPE]];
_p	= _p	+ [SVDTYPE];
_pa	= _pa	+ [8];
_s	= _s	+ [RPG7VTYPE];
_sa	= _sa	+ [2];
_si	= _si	+ [MAKAROVSDTYPE];
_m	= _m	+ [0];
_ma	= _ma	+ [0];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_n	= _n	+ [Localize "STR_DN_KSVK"];
_p	= _p	+ [KSVKTYPE];
_pa	= _pa	+ [10];
_s	= _s	+ [0];
_sa	= _sa	+ [0];
_si	= _si	+ [MAKAROVSDTYPE];
_m	= _m	+ [HANDGRENADETYPE];
_ma	= _ma	+ [2];
_m1	= _m1	+ [0];
_ma1= _ma1	+ [0];

_c = [];
_count = 0;
_totalTemplates = Count _n;

	while {_count < _totalTemplates} do {
	_cost = (eastPrimaryCosts Select (_p Select _count)) + (eastSecondaryCosts Select (_s Select _count)) + (eastSidearmCosts Select (_si Select _count));
	_cost = _cost + ((eastPrimaryAmmoCosts Select (_p Select _count)) * (_pa Select _count));
	_cost = _cost + ((eastSecondaryAmmoCosts Select (_s Select _count)) * (_sa Select _count));
	_cost = _cost + (((eastMiscCosts Select (_m  Select _count)) * (_ma Select _count)) + ((eastMiscCosts Select (_m1 Select _count)) * (_ma1 Select _count)));
	_c = _c + [_cost];
	_count = _count + 1;
	};

eastTemplateNames = _n;
eastTemplatePrimary = _p;
eastTemplatePrimaryAmmo = _pa;
eastTemplateSecondary = _s;
eastTemplateSecondaryAmmo = _sa;
eastTemplateSidearms = _si;
eastTemplateMisc = _m;
eastTemplateAmount = _ma;
eastTemplateMisc1 = _m1;
eastTemplateAmount1 = _ma1;
eastTemplateCosts = _c;

eastDefaultWeapons = [eastPrimaryWeapons Select AK74TYPE];
eastDefaultAmmo = [eastPrimaryAmmo Select AK74TYPE,eastPrimaryAmmo Select AK74TYPE,eastPrimaryAmmo Select AK74TYPE,eastPrimaryAmmo Select AK74TYPE,eastMiscWeapons Select HANDGRENADETYPE,eastMiscWeapons Select HANDGRENADETYPE,eastMiscWeapons Select HANDGRENADETYPE,eastMiscWeapons Select HANDGRENADETYPE];

commonScriptsExecuted = commonScriptsExecuted + 1;