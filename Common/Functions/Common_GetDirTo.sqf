//Last modified 2/14/7
//Get the direction from source to destination.
Private["_source","_destination"];

_source = _this Select 0;
_destination = _this Select 1;

-((((_destination Select 1) - (_source Select 1)) atan2 ((_destination Select 0) - (_source Select 0))) - 90)

//2/14/7 MM - Created file.
