// These are the available fortifications. Add or take as you wish.

// Action text      - The text displayed by the action.
// Classname        - The classname of the object to be placed.
// Distance         - Minimum distance of the object from the player, in metres.
// Direction        - Direction the object will be rotated initially, in degrees (minimum 0, maximum 360).
// Direction range  - The range you can turn the object, in degrees (minimum 0, maximum 360).
//                    This means that the player will be able to set the direction of the object between `direction - direction_range / 2` and `direction + direction_range / 2` degrees.
//                    For example given 180 direction and 60 direction range, player will be able turn the object between 150 and 210 degrees.
// Code             - A piece of code that will be executed when the object placement is confirmed.
//                    Set it to {}, if you don't want to use it. The unit who confirmed the placement and the object placed, are passed as arguments to the code.
//                    An example code that hints the players name could look like {hint str (_this select 0);}.

plank_deploy_fortData = [

// Action text                      |  Classname                            |  Distance     |  Direction     |  Direction Range  |  Code
//--------------------------------------------------------------------------------------------------------------------------------------
["Sandbag wall (short)",                "Land_BagFence_Short_F",                4,              0,                	360,            {}],
["Sandbag wall (long)",                 "Land_BagFence_Long_F",                 4,            	0,                	360,            {}],
["Sandbag wall (round)",                "Land_BagFence_Round_F",                4,            	180,               	360,            {}],
["Sandbag wall (corner)",               "Land_BagFence_Corner_F",               4,            	0,                	360,            {}],
["3YA40 crate",							"rhs_3Ya40_1_single",					1,				0,					360,			{}],
["7YA37 crate",							"rhs_7ya37_1_single",					1,				0,					360,			{}],
["Ammo crate",							"rhs_mags_crate",						1,				0,					360,			{}],
["Launcher crate",						"rhs_launcher_crate",					1,				0,					360,			{}],
["Special weapons crate",				"rhs_spec_weapons_crate",				1,				0,					360,			{}]
];