//? local Al : goto "end"
if (not (local player)) exitwith {};
_group = group player;
_grouppoints = 0;
_x = 0;
_grpscore = 0;
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{	
waituntil {player == leader group player and (count units _group) > 1};
sleep 1;
_count = (count units _group)-1;
_num = 0;
_tempscore = 0;
	for [{_loop1=0}, {_loop1<1}, {_loop1=_loop1}] do
 		{
		_unit2 = (units _group) select _num;
		_Score = rating _unit2;
		_negscore = 0 - _score;
		if (not isplayer _unit2) then {_unit2 addrating _negscore};
		if (vehicle _unit2 == vehicle player) then {_score = 0};
		if (isplayer _unit2) then {_score = 0};
		if (_score > 0) then {_tempscore = _tempscore + 1};
		if (_num == _count)exitwith{};
		_num = _num + 1;
	};
if (_tempscore > 0) then {
	_addscore = _tempscore;
//	_addscore = round(_change / 399);
	if (_addscore > 0) then {
		leader _group groupchat format ["%1 points from Squad",_addscore];
		};
player addscore _addscore;	
  };
};