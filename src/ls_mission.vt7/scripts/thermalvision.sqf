while {true} do
{
	if (currentVisionMode player == 2) then
            {
                _disable = true;
                _veh = vehicle player;

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