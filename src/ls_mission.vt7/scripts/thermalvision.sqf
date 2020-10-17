while {true} do
{ // TEST version
	if (currentVisionMode player == 2) then  {
      _disable = true;
      _veh = vehicle player;

      if (cameraView == "GUNNER") then { // TODO: Добавить вайтлист разрешенного снаряжения
        switch (true) do {
          case ("UAV_01_base_F" in ([ configFile >> "CfgVehicles" >> typeOf(cameraOn), true ] call BIS_fnc_returnParents)): { _disable = false; };
          case (("Launcher_Base_F" in ([ configFile >> "CfgWeapons" >> (currentWeapon player), true ] call BIS_fnc_returnParents)) and (cameraOn == player)): { _disable = false; };
          default { _disable = true; };
        };
      };

      if (_veh != player) then
      {
        _disable = false;
      };

      if (_disable) then
      {
          2 cutText ["<t color='#ff0000' size='4'>Тепловизор отключен!</t><br/>Нажмите кнопку N", "BLACK FADED", 2000, true, true];
          waituntil {currentVisionMode player != 2};
          2 cutFadeOut 0;
      };
  };
  sleep 0.5;
};

