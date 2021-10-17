//WEST
WestAITeamTemplates = [];
WestInfantryTeamTypes = [];
WestDefenseTeamTypes = [];
WestLargeDefenseTeamTypes = [];
WestLightTeamTypes = [];
WestHeavyTeamTypes = [];
WestAirTeamTypes = [];

_n		= ["Infantry"];
_d		= ["Infantry"];
_u		= [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WMGSOLDIER];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIDEFAULTTEAMTYPE = Count WestAITeamTemplates - 1;
WestInfantryTeamTypes = WestInfantryTeamTypes + [WESTAIDEFAULTTEAMTYPE];

_n = _n	+ ["AT"];
_d = _d	+ ["AT"];
_u		= [WATSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WATSOLDIER];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIATTEAMTYPE = Count WestAITeamTemplates - 1;
WestInfantryTeamTypes = WestInfantryTeamTypes + [WESTAIATTEAMTYPE];

_n = _n	+ ["AA"];
_d = _d	+ ["AA"];
_u		= [WAASOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WAASOLDIER];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIAATEAMTYPE = Count WestAITeamTemplates - 1;
WestInfantryTeamTypes = WestInfantryTeamTypes + [WESTAIAATEAMTYPE];

_n = _n	+ ["Sniper"];
_d = _d	+ ["Sniper"];
_u		= [WSNIPER];
_u = _u + [WSOLDIER];
_u = _u + [WSNIPER];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAISNIPERTEAMTYPE = Count WestAITeamTemplates - 1;
WestInfantryTeamTypes = WestInfantryTeamTypes + [WESTAISNIPERTEAMTYPE];

_n = _n	+ ["BlackOps"];
_d = _d	+ ["Black Ops"];
_u		= [WSPECOP];
_u = _u + [WSPECOPSNIPER];
_u = _u + [WSPECOP];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIBLACKOPSTEAMTYPE = Count WestAITeamTemplates - 1;
WestInfantryTeamTypes = WestInfantryTeamTypes + [WESTAIBLACKOPSTEAMTYPE];

_n = _n	+ ["ATAA"];
_d = _d	+ ["AT/AA"];
_u		= [WATSOLDIER];
_u = _u + [WAASOLDIER];
_u = _u + [WATSOLDIER];
_u = _u + [WSOLDIER];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIATAATEAMTYPE = Count WestAITeamTemplates - 1;
WestInfantryTeamTypes = WestInfantryTeamTypes + [WESTAIATAATEAMTYPE];
WestDefenseTeamTypes = WestInfantryTeamTypes + [WESTAIATAATEAMTYPE];

_n = _n	+ ["HummerAssault"];
_d = _d	+ ["HMMWV Assault"];
_u		= ["HMMWV50"];
_u = _u + ["HMMWVMK"];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIHMMWVTEAMTYPE = Count WestAITeamTemplates - 1;
WestLightTeamTypes = WestLightTeamTypes + [WESTAIHMMWVTEAMTYPE];

_n = _n	+ ["HummerAssault"];
_d = _d	+ ["HMMWV AT"];
_u		= ["HMMWVTOW"];
_u = _u + ["HMMWVMK"];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIHMMWVATTEAMTYPE = Count WestAITeamTemplates - 1;
WestLightTeamTypes = WestLightTeamTypes + [WESTAIHMMWVATTEAMTYPE];

_n = _n	+ ["M113"];
_d = _d	+ ["M113"];
_u		= ["M113"];
_u = _u + ["M113"];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIM113TEAMTYPE = Count WestAITeamTemplates - 1;
WestLightTeamTypes = WestLightTeamTypes + [WESTAIM113TEAMTYPE];

_n = _n	+ ["Vulcan"];
_d = _d	+ ["Vulcan"];
_u		= ["Vulcan"];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIVULCANTEAMTYPE = Count WestAITeamTemplates - 1;
WestHeavyTeamTypes = WestHeavyTeamTypes + [WESTAIVULCANTEAMTYPE];

_n = _n	+ ["Stryker"];
_d = _d	+ ["Stryker"];
_u		= ["Stryker_ICV_M2"];
_u = _u + ["Stryker_TOW"];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAISTRYKERTEAMTYPE = Count WestAITeamTemplates - 1;
WestHeavyTeamTypes = WestHeavyTeamTypes + [WESTAISTRYKERTEAMTYPE];

_n = _n	+ ["Tank"];
_d = _d	+ ["Tank"];
_u		= ["M1Abrams"];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIM1TEAMTYPE = Count WestAITeamTemplates - 1;
WestHeavyTeamTypes = WestHeavyTeamTypes + [WESTAIM1TEAMTYPE];

_n = _n	+ ["BasePatrol"];
_d = _d	+ [""];
_u		= [WATSOLDIER];
_u = _u + [WAASOLDIER];
_u = _u + [WATSOLDIER];
_u = _u + [WAASOLDIER];
_u = _u + [WMGSOLDIER];
_u = _u + [WMEDIC];
_u = _u + ["Vulcan"];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIBASEPATROLTEAMTYPE = Count WestAITeamTemplates - 1;
WestInfantryTeamTypes = WestInfantryTeamTypes + [WESTAIBASEPATROLTEAMTYPE];
WestHeavyTeamTypes = WestHeavyTeamTypes + [WESTAIBASEPATROLTEAMTYPE];
WestLargeDefenseTeamTypes = WestLargeDefenseTeamTypes + [WESTAIBASEPATROLTEAMTYPE];

_n = _n	+ ["BaseDefense"];
_d = _d	+ [""];
_u		= [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];
_u = _u + [WSOLDIER];

WestAITeamTemplates = WestAITeamTemplates + [_u];
WESTAIBASEDEFENSETEAMTYPE = Count WestAITeamTemplates - 1;
WestInfantryTeamTypes = WestInfantryTeamTypes + [WESTAIBASEDEFENSETEAMTYPE];
WestHeavyTeamTypes = WestHeavyTeamTypes + [WESTAIBASEDEFENSETEAMTYPE];

WestAITeamTemplateDescriptions = _d;
WestTeamTypes = WestInfantryTeamTypes + WestLightTeamTypes + WestHeavyTeamTypes;

_t		= [WESTAIDEFAULTTEAMTYPE];
_t = _t	+ [WESTAIATTEAMTYPE];
_t = _t	+ [WESTAIM113TEAMTYPE];
_t = _t	+ [WESTAIM1TEAMTYPE];
_t = _t	+ [WESTAIHMMWVTEAMTYPE];
_t = _t	+ [WESTAISTRYKERTEAMTYPE];
_t = _t	+ [WESTAISNIPERTEAMTYPE];
_t = _t	+ [WESTAIBLACKOPSTEAMTYPE];
_t = _t	+ [WESTAIDEFAULTTEAMTYPE];
_t = _t	+ [WESTAIVULCANTEAMTYPE];
_t = _t	+ [WESTAIATTEAMTYPE];
_t = _t	+ [WESTAIAATEAMTYPE];
_t = _t	+ [WESTAISNIPERTEAMTYPE];
_t = _t	+ [WESTAIBLACKOPSTEAMTYPE];
_t = _t	+ [WESTAIM113TEAMTYPE];
_t = _t	+ [WESTAISTRYKERTEAMTYPE];
WestAITeamTypes = _t;

//EAST
EastAITeamTemplates = [];
EastInfantryTeamTypes = [];
EastDefenseTeamTypes = [];
EastLargeDefenseTeamTypes = [];
EastLightTeamTypes = [];
EastHeavyTeamTypes = [];
EastAirTeamTypes = [];

_n		= ["Infantry"];
_d		= ["Infantry"];
_u		= [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [EMGSOLDIER];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIDEFAULTTEAMTYPE = Count EastAITeamTemplates - 1;
EastInfantryTeamTypes = EastInfantryTeamTypes + [EASTAIDEFAULTTEAMTYPE];

_n = _n	+ ["AT"];
_d = _d	+ ["AT"];
_u		= [EATSOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [EATSOLDIER];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIATTEAMTYPE = Count EastAITeamTemplates - 1;
EastInfantryTeamTypes = EastInfantryTeamTypes + [EASTAIATTEAMTYPE];

_n = _n	+ ["AA"];
_d = _d	+ ["AA"];
_u		= [EAASOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [EAASOLDIER];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIAATEAMTYPE = Count EastAITeamTemplates - 1;
EastInfantryTeamTypes = EastInfantryTeamTypes + [EASTAIAATEAMTYPE];

_n = _n	+ ["Sniper"];
_d = _d	+ ["Sniper"];
_u		= [ESNIPER];
_u = _u + [ESOLDIER];
_u = _u + [ESNIPER];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAISNIPERTEAMTYPE = Count EastAITeamTemplates - 1;
EastInfantryTeamTypes = EastInfantryTeamTypes + [EASTAISNIPERTEAMTYPE];

_n = _n	+ ["SpetzNatz"];
_d = _d	+ ["Spetz Natz"];
_u		= [ESPECOP];
_u = _u + [ESPECOPSNIPER];
_u = _u + [ESPECOP];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAISPETZNATZTEAMTYPE = Count EastAITeamTemplates - 1;
EastInfantryTeamTypes = EastInfantryTeamTypes + [EASTAISPETZNATZTEAMTYPE];

_n = _n	+ ["ATAA"];
_d = _d	+ ["AT/AA"];
_u		= [EATSOLDIER];
_u = _u + [EAASOLDIER];
_u = _u + [EATSOLDIER];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIATAATEAMTYPE = Count EastAITeamTemplates - 1;
EastInfantryTeamTypes = EastInfantryTeamTypes + [EASTAIATAATEAMTYPE];
EastDefenseTeamTypes = EastInfantryTeamTypes + [EASTAIATAATEAMTYPE];

_n = _n	+ ["UAZAssault"];
_d = _d	+ ["UAZ Assault"];
_u		= ["UAZMG"];
_u = _u + ["UAZ_AGS30"];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIUAZTEAMTYPE = Count EastAITeamTemplates - 1;
EastLightTeamTypes = EastLightTeamTypes + [EASTAIUAZTEAMTYPE];

_n = _n	+ ["BRDM2"];
_d = _d	+ ["BRDM2"];
_u		= ["BRDM2"];
_u = _u + ["BRDM2_ATGM"];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIBRDM2TEAMTYPE = Count EastAITeamTemplates - 1;
EastLightTeamTypes = EastLightTeamTypes + [EASTAIBRDM2TEAMTYPE];

_n = _n	+ ["ZSU"];
_d = _d	+ ["Shilka"];
_u		= ["ZSU"];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAISHILKATEAMTYPE = Count EastAITeamTemplates - 1;
EastHeavyTeamTypes = EastHeavyTeamTypes + [EASTAISHILKATEAMTYPE];

_n = _n	+ ["BMP2"];
_d = _d	+ ["BMP-2"];
_u		= ["BMP2"];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIBMP2TEAMTYPE = Count EastAITeamTemplates - 1;
EastHeavyTeamTypes = EastHeavyTeamTypes + [EASTAIBMP2TEAMTYPE];

_n = _n	+ ["Tank"];
_d = _d	+ ["Tank"];
_u		= ["T72"];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIT72TEAMTYPE = Count EastAITeamTemplates - 1;
EastHeavyTeamTypes = EastHeavyTeamTypes + [EASTAIT72TEAMTYPE];

_n = _n	+ ["BasePatrol"];
_d = _d	+ [""];
_u		= [EATSOLDIER];
_u = _u + [EAASOLDIER];
_u = _u + [EATSOLDIER];
_u = _u + [EAASOLDIER];
_u = _u + [EMGSOLDIER];
_u = _u + [EMEDIC];
_u = _u + ["ZSU"];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIBASEPATROLTEAMTYPE = Count EastAITeamTemplates - 1;
EastInfantryTeamTypes = EastInfantryTeamTypes + [EASTAIBASEPATROLTEAMTYPE];
EastHeavyTeamTypes = EastHeavyTeamTypes + [EASTAIBASEPATROLTEAMTYPE];
EastLargeDefenseTeamTypes = EastLargeDefenseTeamTypes + [EASTAIBASEPATROLTEAMTYPE];

_n = _n	+ ["BaseDefense"];
_d = _d	+ [""];
_u		= [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];
_u = _u + [ESOLDIER];

EastAITeamTemplates = EastAITeamTemplates + [_u];
EASTAIBASEDEFENSETEAMTYPE = Count EastAITeamTemplates - 1;
EastInfantryTeamTypes = EastInfantryTeamTypes + [EASTAIBASEDEFENSETEAMTYPE];
EastHeavyTeamTypes = EastHeavyTeamTypes + [EASTAIBASEDEFENSETEAMTYPE];

EastAITeamTemplateDescriptions = _d;
EastTeamTypes = EastInfantryTeamTypes + EastLightTeamTypes + EastHeavyTeamTypes;

_t		= [EASTAIDEFAULTTEAMTYPE];
_t = _t	+ [EASTAIATTEAMTYPE];
_t = _t	+ [EASTAIBRDM2TEAMTYPE];
_t = _t	+ [EASTAIT72TEAMTYPE];
_t = _t	+ [EASTAIUAZTEAMTYPE];
_t = _t	+ [EASTAIBMP2TEAMTYPE];
_t = _t	+ [EASTAISNIPERTEAMTYPE];
_t = _t	+ [EASTAISPETZNATZTEAMTYPE];
_t = _t	+ [EASTAIDEFAULTTEAMTYPE];
_t = _t	+ [EASTAISHILKATEAMTYPE];
_t = _t	+ [EASTAIATTEAMTYPE];
_t = _t	+ [EASTAIAATEAMTYPE];
_t = _t	+ [EASTAISNIPERTEAMTYPE];
_t = _t	+ [EASTAISPETZNATZTEAMTYPE];
_t = _t	+ [EASTAIBMP2TEAMTYPE];
_t = _t	+ [EASTAIBMP2TEAMTYPE];
EastAITeamTypes = _t;

commonScriptsExecuted = commonScriptsExecuted + 1;