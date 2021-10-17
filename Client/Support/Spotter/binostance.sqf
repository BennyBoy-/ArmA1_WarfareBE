private ["_unit", "_stance", "_len_right", "_len_left", "_bin_match"];
_unit = _this select 0;
_stance = animationState _unit;
_len_right = 11;
_len_left = 3;
_bin_match = "bin";
_match = [[_stance,_len_right] call KRON_StrRight, _len_left] call KRON_StrLeft;
if (_match == _bin_match) then 
{
   TRUE 
}
else
{
   FALSE 
};
