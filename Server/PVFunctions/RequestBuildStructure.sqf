//Last modified 6/13/7
Private["_client","_direction","_script","_side","_type","_x","_y"];

_side = _this Select 0;
_client = _this Select 1;
_type = _this Select 2;
_x = _this Select 3;
_y = _this Select 4;

//Since type and direction have been encoded together decode them now.
_direction = _type;
_type = _type / 1000;
_type = _type - (_type % 1);
_direction = _direction - _type * 1000;

_script = Call Compile Format["%1StructureScripts Select _type",Str _side];
[_type,_side,[_x,_y,0],_direction] Exec Format["Server\Construction\Construction_%1.sqs",_script];

//6/12/7 MM - Created file.
