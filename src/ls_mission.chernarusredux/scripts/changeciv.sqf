_param = _this select 3;

	_grenades = [];
	{
		_grenades append getArray(configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");
	} forEach getArray(configFile >> "CfgWeapons" >> "Throw" >> "muzzles");

	switch (_param) do {

		case("solid"):
		{
			{player removeWeapon _x;} forEach Weapons player;
			{player removeMagazines _x} forEach _grenades;
			{player removeMagazine _x } forEach magazines player;
		};
	};

	_newGroup = createGroup CIVILIAN;

	if (playerSide isEqualTo INDEPENDENT) then
	{
	[player] joinSilent _newGroup;
	};
	
	player setposatl [getpos grciv select 0, getpos grciv select 1, getposatl grciv select 2];