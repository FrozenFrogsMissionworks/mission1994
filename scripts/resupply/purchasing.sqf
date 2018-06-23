dnct_fnc_showResupplyDialog = {
	[
		[0, "HEADER", "Resupplying"]
		, [1, "LABEL", "Available supply points:"]
		, [1, "LABEL", str(supplyPoints)]
		
		, [2, "DROPDOWN", ["Short sandbag wall (50sp)", "Long sandbag wall (100sp)", "Round sandbag wall (150sp)", "Corner sandbag wall (25sp)"], [50, 100, 150, 25]]
		
		, [3, "LABEL", "         "]

		, [4, "BUTTON", "Purchase", { 
			private _dropDownInput = _this select 0;
			private _selectedItem = _dropDownInput select 0;
			private _itemCost = _dropDownInput select 3; 

			[_selectedItem, _itemCost] call dnct_fnc_purchase;
			closeDialog 2;
		}]
	] call dzn_fnc_ShowAdvDialog;
};

dnct_fnc_purchase = {
	_itemIndex = param[0, 0];
	_itemCost = param[1, 0];

	if (_itemCost <= supplyPoints) then {
		_itemCost spawn dnct_fnc_deductResupplyPoints;

		switch (_selectedItem) do {
			case 0: { [player, [1, 0, 0, 0]] spawn plank_api_fnc_forceAddFortifications; };
			case 1: { [player, [0, 1, 0, 0]] spawn plank_api_fnc_forceAddFortifications; };
			case 2: { [player, [0, 0, 1, 0]] spawn plank_api_fnc_forceAddFortifications; };
			case 3: { [player, [0, 0, 0, 1]] spawn plank_api_fnc_forceAddFortifications; };
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