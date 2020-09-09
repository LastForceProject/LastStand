SWOP_FIX = 
{
	for "_x" from 1 to 4 do 
	{
		endLoadingScreen; 
		sleep 3;
	};
};

[] spawn SWOP_FIX;

[] execVM "onplayerconnected.sqf";

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

enableSaving [false,false];

z6_notSuck = [player] spawn 
{
	while {true} do
	{
		if (currentWeapon player isEqualTo "212th_arifle_z6_F") then 
		{
			player setUnitRecoilCoefficient 0.4; 
			player setCustomAimCoef 0.4;
		}
		else 
		{
			player setUnitRecoilCoefficient 0.7; 
			player setCustomAimCoef 0.7;
		}
	}
};

SquadShield = [player] spawn 
{
	while {true} do 
	{
		_nameplayer = name player; 
		if (_nameplayer find "|G" !=-1) then {} 
		else 
		{
			if (("SW_SquadShield_Mag" in (backpackItems player)) or ("SW_SquadShield_Mag" in (vestItems player)) or ("SW_SquadShield_Mag" in (uniformItems player))) 
			then 
			{
				player removeItem "SW_SquadShield_Mag";
			}
		}
	}
};

RC_ARC_power = [player] spawn 
{
	while {true} do 
	{
		_nameplayer1 = name player; 
		if (_nameplayer1 find "RC" !=-1) 
		then 
		{
			player setUnitRecoilCoefficient 0.1; 
			player setCustomAimCoef 0.1
		}
	}
};

UsableUniformsJump = ["SWOP_Reb_f_WW_Chewbacca1_CombatUniform","SWOP_Reb_f_WW_Chewbacca3_CombatUniform","SWOP_Reb_f_WW_Chewbacca5_CombatUniform"];
player setVariable ["Last_Jump", 0, true];
player addAction ["<t color='#00FF00'>Прыгнуть</t>", "[] execVM 'scripts\fn_jump.sqf'", [], 6, false, true,"User11","((vehicle player == player) && (uniform player in UsableUniformsJump))"];

UniformList = [
	"RC_Uniform","RC_Uniform_13","SWLB_CEE_Gregor_Uniform",
	"RC_Solus_Uniform_47","RC_Solus_Uniform_66","RC_Solus_Uniform_Forest","RC_Solus_Uniform_Sand","RC_Solus_Uniform_Clever","RC_Solus_Uniform_Tox",
	"RC_AiwhaDikut_Uniform","RC_AiwhaSarge_Uniform","RC_AiwhaTyto_Uniform","RC_AiwhaZag_Uniform",
	"RC_Alpha1_Uniform","RC_Alpha2_Uniform",
	"RC_DeltaBoss_Uniform","RC_DeltaFixer_Uniform","RC_DeltaScorch_Uniform","RC_DeltaSev_Uniform",
	"RC_Bravo2_Uniform","RC_BravoRam_Uniform","RC_Bravo3_Uniform","RC_Bravo4_Uniform",
	"RC_MPGunner_Uniform","RC_MPMarksman_Uniform","RC_MPRecon_Uniform","RC_MPStealth_Uniform",
	"RC_Omega_Uniform","RC_OmegaFi_Uniform","RC_OmegaDarman_Uniform","RC_OmegaNiner_Uniform",
	"RC_YayaxCov_Uniform","RC_YayaxDev_Uniform","RC_YayaxJind_Uniform","RC_YayaxYover_Uniform",
	"RC_Yivra_Uniform_Naak","RC_Yivra_Uniform_Goran","RC_Yivra_Uniform_Elyrea","RC_Yivra_Uniform_Aden",
	"RC_Solus_Uniform_Kappa"
			  ];
player setVariable ["Heal_Used",0,true];
player setVariable ["Last_Used",0,true];
player addAction ["<t color='#2ECC71'> Использовать бакту </t>", "[] execVM 'scripts\fn_bacta.sqf'", [], -1, false, true,"User10", "((uniform player in UniformList) && ('ACE_personalAidKit' in (items _this)))"];