_pos = _this select 0;
_n = 20 + ceil random 20;
for [{_i = 0},{_i < _n},{_i = _i + 1}] do
{
   "G_40mm_HE" createVehicleLocal [(_pos select 0) + 10 - random 20, (_pos select 1) + 10 - random 20, 75 +  random 25];
   sleep random 0.2;
};
 