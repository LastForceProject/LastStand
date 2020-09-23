h = [] spawn {
	waitUntil {!isNull findDisplay 46};
	disableSerialization;
	_display = (findDisplay 46) createDisplay "RscDisplayEmpty";
	_ctrlEdit = _display ctrlCreate ["RscEdit", 19998];
	private _width = 30 / 108*safeZoneH /(4/3);
	private _height = 4/ 108*safeZoneH;
	private _bufferY = 15 / 108*safeZoneH;
	private _bufferX = ((safeZoneW / 2) - (_width / 2));
	_ctrlEdit ctrlSetPosition [safeZoneX + _bufferX, safeZoneY + safeZoneH - _bufferY, _width, _height];
	_ctrlEdit ctrlSetBackgroundColor [0,0,0,1];
	_ctrlEdit ctrlCommit 0;
	_ctrlEdit ctrlAddEventHandler ["KeyUp", {params ["_ctrl", "_key"];
		_text = (ctrlText _ctrl);
		_isValid = !(parseNumber _text isEqualTo 0) || (count (_text splitString "0123456789.-") isEqualTo 0); 
		if (_isValid) then {
			_obj = cursorObject;

			_success = false;
			_number = parseNumber _text;
			switch (true) do {
				case (_number isEqualTo 55027 && vehicleVarName _obj == "enter"): {
					_tpto = main_in;
					_text = "После введения пароля ворота отворились, вы долго шли по тёмным коридорам, когда вы увидели свет, вы поняли что пришли";
					_success = true;
				};
				case (_number isEqualTo 77129 && vehicleVarName _obj == "med"): {
					_tpto = med_in;
					_text = "После введения пароля дверь открылась вы вошли в неё и оказались в мед.блоке";
					_success = true;
				};
				case (_number isEqualTo 66028 && vehicleVarName _obj == "HQ"): {
					_tpto = HQ_in;
					_text = "После введения пароля дверь открылась вы зашли и очутились в штабе";
					_success = true;
				};
				case (_number isEqualTo 66028  && vehicleVarName _obj == "SecPart"): {
					_tpto = sec_in;
				    _text = "После введения пароля дверь открылась вы зашли и очутились на распутье";
				    _success = true;
				};
				case (_number isEqualTo 193959  && vehicleVarName _obj == "ToBase"): {
					_tpto = tg_base;
				    _text = "После введения пароля в консоль транспорта вы получили маршрут до лагеря и проехали туда";
				    _success = true;
				};
				default { _success = false; };
				};
			};
			if(_success)
			then {player setposatl [getpos _tpto select 0, getpos _tpto select 1, getposatl _tpto select 2]; titleText [_text, "BLACK FADED", 0.2];} 
			else {hint "Неверный пароль."};
	}];
	ctrlSetFocus _ctrlEdit;
	sleep 15;
	hintSilent "";
};