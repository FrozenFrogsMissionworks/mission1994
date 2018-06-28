dnct_fnc_resupplyArtillery = {
	_shell = param[0, "HE"];

	_center = getMarkerPos "besiegedLocation";
	_position =[_center, 0, 1000] call BIS_fnc_findSafePos;	
	_roundClassname = "rhs_ammo_3WOF27";
	_ammoCount = 4 + round(random 10);

	switch (_shell) do {
		case "HE" :		{ _roundClassname = "rhs_ammo_3WOF27"; };
		case "SMOKE":	{ _roundClassname = "rhs_ammo_53WD546U"; };
		case "ILLUM":	{ _roundClassname = "rhs_ammo_3WS23"; _ammoCount = 2; };
		case "GRAD":	{ _roundClassname = "rhs_ammo_m210F_HE"; _ammoCount = 40; };
		default 		{ hint "Resupply system error: invalid artillery round type @ dnct_fnc_resupplyArtillery"; };
	};

	// I might not be going to hell for the code in the next few lines but I'll sure get that condemning glance from Saint Peter
	openMap true;
	hint "Click on a position to call an artillery strike to.";	
	[_shell, _roundClassname, _ammoCount] onMapSingleClick 
	{
		params["_shell", "_roundClassname", "_ammoCount"];

		onMapSingleClick "";

		openMap false;
		hint format["Roger that, %1 shells are inbound.", _shell];

		0 = [_pos, _roundClassname, _ammoCount] spawn {
			params["_position", "_roundClassname", "_ammoCount"];
			_postionDescription = [_position, "CIRCLE", 0, 100];		
			
			player sideChat _roundClassname;

			sleep 1;

			[_postionDescription, _roundClassname, 1, _ammoCount] spawn dzn_fnc_StartVirtualFiremission;
		};
	};
};