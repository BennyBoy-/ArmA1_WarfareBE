_n		= ["DefaultTeam"];
_u		= [GLEADER];
_u = _u + [GSOLDIER];
_u = _u + [GMARKSMAN];
_u = _u + [GMEDIC];
_u = _u + [GSPECOP];
_u = _u + [GSNIPER];
_u = _u + [GGSOLDIER];
_u = _u + [GMGSOLDIER];
Call Compile Format["Res%1Units = _u",_n Select (Count _n - 1)];

_n		= ["DefaultSmallTeam"];
_u		= [GLEADER];
_u = _u + [GSOLDIER];
_u = _u + [GMARKSMAN];
_u = _u + [GMEDIC];
_u = _u + [GGSOLDIER];
_u = _u + [GMGSOLDIER];
Call Compile Format["Res%1Units = _u",_n Select (Count _n - 1)];

_n		= ["DefaultSmallTeam1"];
_u		= [GLEADER];
_u = _u + [GSOLDIER];
_u = _u + [GMARKSMAN];
_u = _u + [GGUARD];
_u = _u + [GMEDIC];
_u = _u + [GSOLDIER];
_u = _u + [GMGSOLDIER];
Call Compile Format["Res%1Units = _u",_n Select (Count _n - 1)];

_n		= ["DefaultSmallTeam2"];
_u		= [GSOLDIER];
_u = _u + [GSPECOP];
_u = _u + [GMARKSMAN];
_u = _u + [GMEDIC];
Call Compile Format["Res%1Units = _u",_n Select (Count _n - 1)];

_n = _n + ["ATTeam"];
_u		= [GLEADER];
_u = _u + [GATSOLDIER];
_u = _u + [GSOLDIER];
_u = _u + [GATSOLDIER];
_u = _u + [GSOLDIER];
_u = _u + [GSOLDIER];
_u = _u + [GMEDIC];
Call Compile Format["Res%1Units = _u",_n Select (Count _n - 1)];

_n = _n + ["AATeam"];
_u		= [GLEADER];
_u = _u + [GAASOLDIER];
_u = _u + [GSOLDIER];
_u = _u + [GAASOLDIER];
_u = _u + [GSOLDIER];
_u = _u + [GAASOLDIER];
_u = _u + [GSOLDIER];
_u = _u + [GMEDIC];
Call Compile Format["Res%1Units = _u",_n Select (Count _n - 1)];

_n = _n + ["LightMechanizedTeam"];
_u		= ["M113_RACS"];
_u = _u + ["LandroverMG"];
Call Compile Format["Res%1Units = _u",_n Select (Count _n - 1)];

_n = _n + ["MechanizedTeam"];
_u		= ["M113_RACS"];
_u = _u + ["Vulcan_RACS"];
_u = _u + ["LandroverMG"];
Call Compile Format["Res%1Units = _u",_n Select (Count _n - 1)];

_n = _n + ["ArmoredTeam"];
_u		= ["T72_RACS"];
Call Compile Format["Res%1Units = _u",_n Select (Count _n - 1)];

resistanceTeamTypes = _n;