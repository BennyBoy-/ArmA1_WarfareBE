Private ["_finalNumber","_numbers","_text"];
_text = _this select 0;

_text = [];
_numbers = [];

_text = toArray(str(_unit));

_numbers = _numbers + [_text select 11] + [_text select 12];
_finalNumber = toString(_numbers);

_finalNumber