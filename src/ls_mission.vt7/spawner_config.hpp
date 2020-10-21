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
			2,
			"gui_spawner\images\vehicles\aa.paa"
		},
		{
			"Легкий транспорт RTT",
			"3as_RTT",
			"vehicle_count_spawn_17",
			1,
			"gui_spawner\images\vehicles\rtt.paa"
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
			"RD_501_ARC_170_MK2",
			"laat_count_spawn_4",
			2
		},
		{
			"Y-WING",
			"RD501_Y_wing_Mk2",
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
		}
	};
	spawnpoints[] = 
	{
		{"ВПП #1",{"air_spawn_0"},true},
		{"ВПП #2",{"air_spawn_1"},true},
		{"ВПП #3",{"air_spawn_2"},true}
	};
};
