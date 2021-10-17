Howitzer = {
		_unit = _this select 0;
		_type = _this select 1;
	
		_shell = nearestObject[_this select 0,_this select 1];
		
		if (isNull _shell) exitWith {};
		
		if (_type != "Sh_120_HE" and _type != "Sh_125_HE" and _type != "Sh_120_SABOT" and _type != "Sh_125_SABOT") exitwith {};
		
		_pos = [];
		
		while {true} do {
		
			if (isNull _shell) exitWith {};
			
			_pos = position _shell;
		
		};
		
		_base = "HeliHEmpty" createVehicleLocal _pos;
		_blast = "Bo_GBU12_LGB" createVehicle _pos;
		_blast setPos [(_pos select 0),(_pos select 1),0];
		
		deleteVehicle _base;
};