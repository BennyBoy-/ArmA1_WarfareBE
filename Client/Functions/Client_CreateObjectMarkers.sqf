//Last modified 12/13/7
//*****************************************************************************************
//Description: Create markers for list of objects & return them.
//*****************************************************************************************
Private["_color","_count","_marker","_markers","_name","_objects","_total","_type","_WP","_WPs"];

_objects = _this Select 0;
_name = _this Select 1;
_type = _this Select 2;
_color = _this Select 3;

_markers = [];
_total = Count _objects;

for [{_count = 0},{_count < _total},{_count = _count + 1}] do 
{
	_marker = Format["%1%2",_name,_count];
	CreateMarkerLocal [_marker,GetPos (_objects Select _count)];
	_marker SetMarkerTypeLocal _type;
	_marker SetMarkerColorLocal _color;

	_markers = _markers + [_marker];
};

_markers

//*****************************************************************************************
//12/13/7 MM - Created file.
