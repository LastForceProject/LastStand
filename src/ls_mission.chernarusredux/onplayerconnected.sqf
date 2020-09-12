// -- Ранговая система.

_nameplayer = name player;
if ((_nameplayer find "CS" !=-1) || (_nameplayer find "CPL" !=-1)) then 
{
	player setRank "CORPORAL"
} 
else 
{
	if ((_nameplayer find "MSG" !=-1) || (_nameplayer find "SG" !=-1) || (_nameplayer find "SSG" !=-1) || (_nameplayer find "SPSG" !=-1)) then 
	{
		player setRank "SERGEANT"
	} 
	else 
	{
		if ((_nameplayer find "MLT" !=-1) || (_nameplayer find "LT" !=-1) || (_nameplayer find "SLT" !=-1) || (_nameplayer find "SPLT" !=-1)) then 
		{
			player setRank "LIEUTENANT"
		} 
		else 
		{
			if ((_nameplayer find "CPT" !=-1) || (_nameplayer find "MAJ" !=-1)) then 
			{
				player setRank "CAPTAIN"
			} 
			else 
			{
				if ((_nameplayer find "COL" !=-1) || (_nameplayer find "CC" !=-1) || (_nameplayer find "MC" !=-1) || (_nameplayer find "GEN" !=-1)) then 
				{
					player setRank "COLONEL"
				}
			}
		}
	}
};

// -- РП вступление.

switch (playerSide) do 
{
	case west: 
	{
		_dayTime = [daytime] call BIS_fnc_timeToString;
		[
			[
			["Планета: Лон'Кан, База ВАР","size = '0.7'"],
			["","<br/>"],
			["Местное время: ","size = '0.7'"],
			[str _dayTime,"size = '0.7'"],
			["","<br/>"]
			],
			safeZoneX / 45.5, safeZoneH / 2, true, "<t font='PuristaBold'>%1</t>", [], {false}, true
		] spawn BIS_fnc_typeText2;
	};
	case east: {};
	case resistance: 
	{
		_dayTime = [daytime] call BIS_fnc_timeToString;
		[
			[
			["Планета: Лон'Кан, Неизвестное место","size = '0.7'"],
			["","<br/>"],
			["Местное время: ","size = '0.7'"],
			[str _dayTime,"size = '0.7'"],
			["","<br/>"]
			],
			safeZoneX / 45.5, safeZoneH / 2, true, "<t font='PuristaBold'>%1</t>", [], {false}, true
		] spawn BIS_fnc_typeText2;
	};
	case civilian: {};
};

// -- Created by.

_onScreenTime = 2;
sleep 15; // Время до начала титров
_role1 = "Добро пожаловать на The Last Stand RP";
_role1names = [profileName];
_role2 = "Игровой проект Last Force Project";
_role2names = ["Thanks to: KapayJI, SWLS, wRaiz, Flin <t size='0.70' align='right' color='#ff0000'>SCHTAMP.</t>"];
_role3 = "Посетите нашу группу VK";
_role3names = ["vk.com/arma3lfp"];
_role4 = "Присоединяйтесь к Discord";
_role4names = ["https://dscrd.in/LastStand"];
_role5 = "Ознакомьтесь с информацией об игре в Дискорде";
_role5names = [""];
_role6 = "Удачной игры!";
_role6names = [profileName];
{
	sleep 6; // #1f75fe
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.65' color='#00ff00' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#ffffff' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.9);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50], // Стандарт: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], // Стандарт: 0.8,0.7
		_onScreenTime, 0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach 
[ // В списке ниже должно быть точно такое же количество ролей, как и в списке выше
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names]
];

// -- Анонс рестартов.

sleep 65;
for "_i" from 1 to 14 do 
{
	[
		"<t color='#ffffff' font='TahomaB' size = '.7'>Напоминаем,<br/>что рестарты происходят<br/>в автоматическом режиме<br/>в <t color='#8B0000' font='TahomaB' size = '.8'>02:00</t> и <t color='#8B0000' font='TahomaB' size = '.8'>09:00</t> по МСК</t>",
		[safezoneX + safezoneW - 0.8,0.50], -1, 10 
	] spawn BIS_fnc_dynamicText
};