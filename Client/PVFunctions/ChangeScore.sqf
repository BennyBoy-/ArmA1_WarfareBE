//Last modified 12/18/7
Private ["_newScore","_playerChanged","_oldScore"];

_playerChanged = _this Select 0;
_newScore = _this Select 1;

_oldScore = Score _playerChanged;
_playerChanged AddScore -_oldScore;
_playerChanged AddScore _newScore;

//12/18/7 MM - Created file.
