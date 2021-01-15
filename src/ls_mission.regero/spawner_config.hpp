/*
class SpawnerClass - Название спавнера, используеться как аргумент для вызова функции
{
	conditionToAccess - СТРОКА - Условие для доступа к спавнеру (строка которая при компиляции в код должна возвращать true или false). Если True игрок получит доступ к спавнеру.
	
	vehicles - МАССИВ МАССИВОВ - Массив с доступной техникой.
	|- 0 - СТРОКА - Название техники которое будет отображаться в панели спавнера
	|- 1 - СТРОКА - Класснейм
	|- 2 - СТРОКА - Название переменной, где будет храниться кол-во использованной техники (в будущем будет определяться автоматически)
	|- 3 - ЧИСЛО  - Максимальное и изначально доступное число техники
	|- 4 - СТРОКА - НЕОБЯЗАТЕЛЕН -  Путь до картинки в меню (если не указывать будет использован баннер проекта)
	|- 4 - СТРОКА - НЕОБЯЗАТЕЛЕН -  Описание техники, которое отображаеться в правой части дисплея (если не указывать, описание будет пустым)
	spawnPoints - ARRAY OF ARRAYS - Spawn positions (markers/positions)
	|- 0 - STRING - Display name in the dialog
	|- 1 - МАССИВ ЗНАЧЕНИЙ - Точки спавна типа МАССИВ {x, y, z} или СТРОКА название предмета (обычно косилки) на карте, на месте которого будет появляться техника
	|- 2 - БУЛЕВО - True или False - Пока не знаю зачем, поэтому по используйте true

};

ПРИМЕР:
class MySuperSpawner
{	
	conditionToAccess = "true"; // 'SCHTAMP' in name player // Будет True только в том случае, если в имени игрока будет слово SCHTAMP

	vehicles[] = // (У последнего элемента массива не должно быть запятой)
	{
		{
			"Название техники 1",
			"класснейм_техники_1",
			"название_переменной_1",
			999, // начальное число техники == 999
			"путь/до/картинки.paa",
			"Мое самое лучшее описание этой техники."
		},
		{
			"Название техники 2",
			"класснейм_техники_2",
			"название_переменной_2"
		} // <=== вот тут не должно быть запятой
		
	};
	spawnpoints[] = 
	{
		{"Название моей точки спавна 1",{"название_моего_предмета_1", {x,y,z}},true}
	};
};
*/

class MainSpawn
{	
	conditionToAccess = "true";

	vehicles[] = 
	{
		{"=====Наземная техника=====","","","","",""},
		{
			"TX-130",
			"SWLG_tanks_tx130",
			"vehicle_count_spawn_1",
			2,
			"gui_spawner\images\vehicles\tx130mk1.paa"
		},
		{
			"БТР ""Банта""",
			"212th_B_APC_Wheeled_01_cannon_F",
			"vehicle_count_spawn_2",
			2,
			"gui_spawner\images\vehicles\batha.paa"
		},
		{
			"Машина технического обслуживания ""Варден""",
			"212AA_Galoomp",
			"vehicle_count_spawn_3",
			2
		},
		{
			"Легкий транспорт RTT",
			"3as_RTT",
			"vehicle_count_spawn_4",
			1,
			"gui_spawner\images\vehicles\rtt.paa"
		},
		{
			"BARC спидер",
			"ls_ground_barc",
			"vehicle_count_spawn_5",
			10,
			"gui_spawner\images\vehicles\barc.paa"
		}
	};
	spawnpoints[] = 
	{
		{"Ангар #1",{"angar_spawn_0"},true},
		{"Ангар #2",{"angar_spawn_1"},true}
	};
};

class BigSpawn
{	
	conditionToAccess = "true";

	vehicles[] = 
	{
		{"=====Крупногабаритная техника=====","","","","",""},
		{
			"Мобильная арт установка AV-7",
			"3as_AV7",
			"big_count_spawn_1",
			4,
			"gui_spawner\images\vehicles\av7.paa"
		},
		{
        "HAVw A6 Juggernaut",
		"3as_Jug",
		"big_count_spawn_3",
		3
		},
		{
			"ATAP",
			"3as_ATAP_base",
			3
		},
		{
			"RX200 Артиллерия",
			"442_rx200_arty",
			3
		}
		
	};
	spawnpoints[] = 
	{
		{"Место для большой техники #1",{"big_spawn_1"},true}
	};
};

class AirSpawn
{	
	conditionToAccess = "true";

	vehicles[] = 
	{
		{"=====Воздушная техника=====","","","","",""},
		{
			"LAAT/I (Gunship)",
			"ls_laat_ab",
			"laat_count_spawn_1",
			6
		},
		{
			"LAAT/I Gunship (Medevac)",
			"ls_laat_medevac",
			"laat_count_spawn_2",
			6
		},
		{
			"Z95",
			"3as_Z95_Republic",
			"z95_count_spawn_1",
			6
		},
	};
	spawnpoints[] = 
	{
		{"ВПП #1",{"air_spawn_0"},true},
		{"ВПП #2",{"air_spawn_1"},true},
		{"ВПП #3",{"air_spawn_2"},true}
	};
};
