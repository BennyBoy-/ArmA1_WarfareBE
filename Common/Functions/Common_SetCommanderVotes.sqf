//Last modified 1/8/8
//Description:  sets all commander vote to the same value.
Private["_count","_side","_teams","_total","_value"];

_side = _this Select 0;
_value = _this Select 1;

_teams = Call Compile Format["%1Teams",Str _side];
_total = Count _teams + 1;

//Count votes.
for [{_count = 1},{_count < _total},{_count = _count + 1}] do
{
	if (IsPlayer Leader (_teams Select (_count - 1))) then
	{
		Call Compile Format["if (%1Team%2Vote != _value) then {%1Team%2Vote = _value;PublicVariable ""%1Team%2Vote""};",Str _side,_count];
	}
};

//1/8/8 MM - Created file.
