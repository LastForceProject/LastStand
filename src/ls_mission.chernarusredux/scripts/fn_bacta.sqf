used = player getVariable 'Heal_Used';
last_used = player getVariable 'Last_Used';
if (time - last_used < 30) then
	{
	hint format ["Бакта ещё не готова к использованию!"];
	}
else
	{	
	if (used < 2) then 
		{
			player setVariable ["Heal_Used", used + 1, true];
			player setVariable ["Last_Used", time, true];
			hint format ["Осталось зарядов: %1", 2-used];
			addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
			titleCut ["", "WHITE IN", 2];
			[player] call ace_medical_treatment_fnc_fullHealLocal;
			hintSilent "";
		}
	else
		{
			player setVariable ["Heal_Used", 0, true];
			hint format ["Бакта пуста!"];
			player removeItem "ACE_personalAidKit";
			addCamShake [6, 8, 3]; //сила, длительность, скорость тряски
			titleCut ["", "WHITE IN", 2];
			[player] call ace_medical_treatment_fnc_fullHealLocal;
			hintSilent "";
		};
};