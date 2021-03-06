dnct_fnc_showResupplyDialog = {
	_target = param[0, objNull];
	_caller = param[1, objNull];
	_id = param[2, -1];
	_arguments = param[3, []];

	if (damage _target == 1) exitWith { hint "Uniable to request resupplies - the radio is destroyed."; };

	[
		[0, "HEADER", PD_STR_HEADER]
		, [1, "LABEL", PD_STR_AVAILABLE_SUPPLY_POINTS]
		, [1, "LABEL", str(supplyPoints)]
		
		, [2, "LABEL", ""]

		, [3, "LABEL", PD_STR_SElECT_SUPPLY_OPTION]

		, [4, "DROPDOWN", PDO_NAMES, PDO_COSTS]

		, [5, "LABEL", ""]

		, [6, "BUTTON", PD_STR_PURCHASE_BUTTON, { 
			private _dropDownInput = _this select 0;
			private _selectedItem = _dropDownInput select 0;
			private _itemCost = _dropDownInput select 3; 
			private _itemName = _dropDownInput select 1;

			[_selectedItem, _itemCost, _itemName] call dnct_fnc_purchase;
			closeDialog 2;
		}]
	] call dzn_fnc_ShowAdvDialog;
};

dnct_fnc_purchase = {
	_itemIndex = param[0, 0];
	_itemCost = param[1, 0];
	_itemName = param[2, ""];

	if (_itemCost <= supplyPoints) then {
		_itemCost spawn dnct_fnc_deductResupplyPoints;

		hint format["%1 has been bought.", _itemName];

		switch (_selectedItem) do {
			case 0: { ["SHORT"] call dnct_fnc_resupplySandbags; };
			case 1: { ["LONG"] call dnct_fnc_resupplySandbags; };
			case 2: { ["ROUND"] call dnct_fnc_resupplySandbags; };
			case 3: { ["CORNER"] call dnct_fnc_resupplySandbags; };
			case 4: { ["3YA40"] call dnct_fnc_resupplyCrate; };
			case 5: { ["7YA37"] call dnct_fnc_resupplyCrate; };
			case 6: { ["AMMO"] call dnct_fnc_resupplyCrate; };
			case 7: { ["LAUNCHER"] call dnct_fnc_resupplyCrate; };
			case 8: { ["SPECIALW"] call dnct_fnc_resupplyCrate; };
			case 9: { 0 = ["ILLUM"] spawn dnct_fnc_resupplyArtillery; };
			case 10: { 0 = ["SMOKE"] spawn dnct_fnc_resupplyArtillery; };
			case 11: { 0 = ["HE"] spawn dnct_fnc_resupplyArtillery; };
			case 12: { 0 = ["GRAD"] spawn dnct_fnc_resupplyArtillery; };
		};
	} else {
		hint "Not enough supply points.";
	};
};

dnct_fnc_deductResupplyPoints = {
	_amount = param[0, 0];
	supplyPoints = supplyPoints - _amount;
	publicVariable "supplyPoints";
};