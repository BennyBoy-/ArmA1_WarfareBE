//Last modified 11/28/7
//Description:  Workaround since setting a structure's direction 
//on the server is not updating to remote clients.

Private["_structure","_direction"];

_structure = _this Select 0;
_direction = _this Select 1;

_structure SetDir _direction;
_structure SetPos GetPos _structure;

//9/5/7 MM - Created file.
