private ["_unit", "_obj", "_ds", "_max", "_offset", "_dvec", "_mpos", "_wpos", "_gl_north", "_breakflag", "_i"];

_ds = 0.50;
_max = 1000;
_offset = 1;

_unit = _this select 0;
if (count _this > 1) then {_obj = _this select 1;};
_dvec = _unit weaponDirection "BINOCULAR";
_mpos = getPos _unit;
_height = -((_unit modelToWOrld [0,0,0]) select 2);
_wpos = [];
_gl_north = "LOGIC" createVehicleLocal _mpos;
_gl_north setPos _mpos;
_gl_north setDir 0;
_breakflag = TRUE;
for [{_i = _ds},{_i <= _max && _breakflag},{_i = _i + _ds}] do
{
      _mpos = [_i * (_dvec select 0), _i * (_dvec select 1), _i * (_dvec select 2) + _offset];
      _wpos = _gl_north modelToWorld _mpos;
      if (((_wpos select 2)) <= _height) then {_breakflag = FALSE;};
};
deleteVehicle _gl_north;
if _breakflag then
{
}
else
{
   if (isnil "_obj") then
   {
      _wpos
   }
   else
   {
      _obj setPos _wpos;
      TRUE
   };
};




 