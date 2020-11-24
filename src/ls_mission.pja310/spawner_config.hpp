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
			"M12 FAV Warthog (Unarmed)",
			"OPTRE_M12_FAV",
			"vehicle_count_spawn_0",
			4,
			"gui_spawner\images\vehicles\warthog.paa"
		},
		{
			"M12 Warthog (Пулемет)",
			"OPTRE_M12_LRV",
			"vehicle_count_spawn_1",
			2,
			"gui_spawner\images\vehicles\warthog_mg.paa"
		},
		{
			"M12A1 Warthog (Ракеты)",
			"OPTRE_M12A1_LRV",
			"vehicle_count_spawn_2",
			1,
			"gui_spawner\images\vehicles\warthog_rocket.paa"
		},
		{
			"M12A1 Warthog (AA)",
			"OPTRE_M12R_AA",
			"vehicle_count_spawn_3",
			1,
			"gui_spawner\images\vehicles\warthog_rocket.paa"
		},
		{
			"M12G1 Warthog (Гаусс)",
			"OPTRE_M12G1_LRV",
			"vehicle_count_spawn_4",
			1,
			"gui_spawner\images\vehicles\warthog_gaus.paa"
		},
		{
			"M831 Warthog (Транспортный)",
			"OPTRE_M813_TT",
			"vehicle_count_spawn_5",
			2,
			"gui_spawner\images\vehicles\warthog_tt.paa"
		},
		{
			"BARC спидер",
			"3AS_Barc",
			"vehicle_count_spawn_6",
			10,
			"gui_spawner\images\vehicles\barc.paa"
		},
		{
			"BARC спидер с коляской",
			"3AS_BarcSideCar",
			"vehicle_count_spawn_7",
			10,
			"gui_spawner\images\vehicles\barc2.paa"
		},
		{
			"TX-130",
			"3as_saber_m1",
			"vehicle_count_spawn_8",
			2,
			"gui_spawner\images\vehicles\tx130mk1.paa"
		},
		{
			"TX-130 Recon",
			"3as_saber_m1Recon",
			"vehicle_count_spawn_9",
			2,
			"gui_spawner\images\vehicles\tx130mk2.paa"
		},
		{
			"TX-130 Super Saber",
			"3as_saber_super",
			"vehicle_count_spawn_10",
			2,
			"gui_spawner\images\vehicles\tx130mk3.paa"
		},
		{
			"TX-130 GL",
			"3as_saber_m1G",
			"vehicle_count_spawn_11",
			2,
			"gui_spawner\images\vehicles\tx130mk4.paa"
		},
		{
			"Требушет",
			"RD501_heavy_ordinance_tank_republic",
			"vehicle_count_spawn_12",
			2,
			"gui_spawner\images\vehicles\trebuchet.paa"
		},
		{
			"Катапульта",
			"RD501_rocket_ordinance_tank_republic",
			"vehicle_count_spawn_13",
			2,
			"gui_spawner\images\vehicles\catapult.paa"
		},
		{
			"БТР ""Банта""",
			"RD501_bantha_501st_MkI",
			"vehicle_count_spawn_14",
			2,
			"gui_spawner\images\vehicles\batha.paa"
		},
		{
			"ПВО",
			"RD501_Longbow_Republic",
			"vehicle_count_spawn_15",
			2,
			"gui_spawner\images\vehicles\aa.paa"
		},
		{
			"Машина технического обслуживания ""Варден""",
			"RD501_warden_tank_field",
			"vehicle_count_spawn_16",
			2
		},
		{
			"Легкий транспорт RTT",
			"3as_RTT",
			"vehicle_count_spawn_17",
			1,
			"gui_spawner\images\vehicles\rtt.paa"
		},
		{
			"Легкий транспорт БСО ""МАВ-21""",
			"JMM_212th_B_MRAP_unarmed",
			"vehicle_count_spawn_18",
			2
		}
	};
	spawnpoints[] = 
	{
		{"Ангар #1",{"angar_spawn_0"},true},
		{"Ангар #2",{"angar_spawn_1"},true},
		{"Ангар #3",{"angar_spawn_2"},true}
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
			1,
			"gui_spawner\images\vehicles\av7.paa"
		},
		{
			"Сверхтяжелый транспорт UTAT",
			"3as_UTAT",
			"big_count_spawn_2",
			1,
			"gui_spawner\images\vehicles\utat.paa"
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
			4
		},
		{
			"LAAT/I Gunship (Medevac)",
			"ls_laat_medevac",
			"laat_count_spawn_2",
			2
		},
		{
			"LAAT/I Gunship (Pylons)",
			"ls_laat",
			"laat_count_spawn_3",
			1
		},
		{
			"ARC-170",
			"RD501_ARC_170_MKII",
			"laat_count_spawn_4",
			2
		},
		{
			"Y-WING",
			"RD501_Y_wing_MkII",
			"laat_count_spawn_5",
			2
		},
		{
			"Z-95 Headhunter",
			"3as_Z95_Republic",
			"laat_count_spawn_6",
			2
		},
		{
			"V-Wing",
			"RD501_v_wing_MKII",
			"laat_count_spawn_7",
			2
		},
		{
			"LAAT/I (Gunship | Muunilinst 10)",
			"ls_laat_ab",
			"laat_count_spawn_8",
			1
		},
		{
			"LAAT/I (MK2, MCC)",
			"swop_LAATmk2",
			"laat_count_spawn_9",
			1
		},
		{
			"LAAT/C",
			"RD501_LAAT_cargo_Mk2",
			"laat_count_spawn_10",
			2
		}
	};
	spawnpoints[] = 
	{
		{"ВПП #1",{"air_spawn_0"},true},
		{"ВПП #2",{"air_spawn_1"},true},
		{"ВПП #3",{"air_spawn_2"},true},
		{"ВПП #4",{"air_spawn_3"},true},
		{"ВПП #5",{"air_spawn_4"},true}
	};
};
