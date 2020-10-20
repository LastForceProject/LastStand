class MainSpawn
{	
	conditionToAccess = "true";

	vehicles[] = 
	{
		{"=====Наземная техника=====","","","","",""},
		{
			"M12 FAV Warthog (Unarmed)",
			"OPTRE_M12_FAV",
			"laat_count_spawn",
			4,
			"gui_spawner\images\vehicles\warthog.paa"
		},
		{
			"M12 Warthog (Пулемет)",
			"OPTRE_M12_LRV",
			"laat_cargo_count_spawn",
			2,
			"gui_spawner\images\vehicles\warthog_mg.paa"
		},
		{
			"M12A1 Warthog (Ракеты)",
			"OPTRE_M12A1_LRV",
			"laat_cargo_count_spawn1",
			1,
			"gui_spawner\images\vehicles\warthog_rocket.paa"
		},
		{
			"M12A1 Warthog (AA)",
			"OPTRE_M12R_AA",
			"laat_cargo_count_spawn2",
			1,
			"gui_spawner\images\vehicles\warthog_rocket.paa"
		},
		{
			"M12G1 Warthog (Гаусс)",
			"OPTRE_M12G1_LRV",
			"laat_cargo_count_spawn2",
			1,
			"gui_spawner\images\vehicles\warthog_gaus.paa"
		},
		{
			"M831 Warthog (Транспортный)",
			"OPTRE_M813_TT",
			"laat_cargo_count_spawn2",
			2,
			"gui_spawner\images\vehicles\warthog_tt.paa"
		},
		{
			"BARC спидер",
			"3AS_Barc",
			"laat_cargo_count_spawn2",
			10,
			"gui_spawner\images\vehicles\barc.paa"
		},
		{
			"BARC спидер с коляской",
			"3AS_BarcSideCar",
			"laat_bso_count_spawn",
			10,
			"gui_spawner\images\vehicles\barc2.paa"
		},
		{
			"TX-130",
			"3as_saber_m1",
			"laat_bso_count_spawn",
			2,
			"gui_spawner\images\vehicles\tx130mk1.paa"
		},
		{
			"TX-130 Recon",
			"3as_saber_m1Recon",
			"laat_bso_count_spawn",
			2,
			"gui_spawner\images\vehicles\tx130mk2.paa"
		},
		{
			"TX-130 Super Saber",
			"3as_saber_super",
			"laat_bso_count_spawn",
			2,
			"gui_spawner\images\vehicles\tx130mk3.paa"
		},
		{
			"TX-130 GL",
			"3as_saber_m1G",
			"laat_bso_count_spawn",
			2,
			"gui_spawner\images\vehicles\tx130mk4.paa"
		},
		{
			"Требушет",
			"RD501_heavy_ordinance_tank_republic",
			"laat_bso_count_spawn",
			2,
			"gui_spawner\images\vehicles\trebuchet.paa"
		},
		{
			"Катапульта",
			"RD501_rocket_ordinance_tank_republic",
			"laat_bso_count_spawn",
			2,
			"gui_spawner\images\vehicles\catapult.paa"
		},
		{
			"БТР ""Банта""",
			"RD501_bantha_501st_MkI",
			"laat_bso_count_spawn",
			2,
			"gui_spawner\images\vehicles\batha.paa"
		},
		{
			"ПВО",
			"RD501_Longbow_Republic",
			"laat_bso_count_spawn",
			2,
			"gui_spawner\images\vehicles\aa.paa"
		},
		{
			"Сверхтяжелый транспорт UTAT",
			"3as_UTAT",
			"laat_bso_count_spawn",
			1,
			"gui_spawner\images\vehicles\utat.paa"
		},
		{
			"Легкий транспорт RTT",
			"3as_RTT",
			"laat_bso_count_spawn",
			1,
			"gui_spawner\images\vehicles\rtt.paa"
		},
		{
			"Мобильная арт установка AV-7",
			"3as_AV7",
			"laat_bso_count_spawn",
			1,
			"gui_spawner\images\vehicles\av7.paa"
		}
	};
	spawnpoints[] = 
	{
		{"ТП 2 (Рабочая объект)",{{0,0,0}},true},
		{"ТП 3 (Рабочая координаты)",{{0,0,0}},true}
	};
};