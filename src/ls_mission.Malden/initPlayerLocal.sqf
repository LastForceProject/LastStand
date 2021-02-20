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
    "RC_Nemesis_Uniform_Tech","RC_Nemesis_Uniform_Scroll","RC_Nemesis_Uniform_Gordon","RC_Nemesis_Uniform_EOD",
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
	"RC_Solus_Uniform_Kappa","RC_Solus_Uniform_Nort", "RC_Solus_Uniform_02"
			  ];
player setVariable ["Heal_Used",0,true];
player setVariable ["Last_Used",0,true];
player addAction ["<t color='#2ECC71'> Использовать бакту </t>", "[] execVM 'scripts\fn_bacta.sqf'", [], -1, false, true,"User10", "((uniform player in UniformList) && ('ACE_personalAidKit' in (items _this)))"];

waitUntil {player == player};
waitUntil{!isNull player};
waituntil {!isnull (finddisplay 46)};
sleep 10; // Обязательно ждём пока мили система загрузиться и уже после меняем функцию.
SW_AdditionalDamage = {
_unitToPlay = _this select 0;
if (lifeState _unitToPlay == "INCAPACITATED") exitWith {};
_var = player getVariable "IMS_LaF_ShotsToTakeOutOneGuy";
_var = _var - 1;
hintSilent str _var;
if (_var <= 0) exitWith {
[_unitToPlay, 0.1, "body", "bullet"] remoteExec ["ace_medical_fnc_addDamageToUnit", _unitToPlay];
[_unitToPlay, true] remoteExec ["ace_medical_fnc_setUnconscious", _unitToPlay];
};
player setVariable ["IMS_LaF_ShotsToTakeOutOneGuy",_var,true];
}; 



if (typeOf player == "B_recon_F") exitWith { 
player setVariable ["IMS_LaF_ShotsToTakeOutOneGuy",25,true]; ///Падаван
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
player forceAddUniform "SS_JEDIBA_U";
};
if (typeOf player == "B_recon_medic_F") exitWith { 
player setVariable ["IMS_LaF_ShotsToTakeOutOneGuy",50,true]; ///Рыцарь
player setVariable ["LaF_HitCountToKill",2,true];
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
player forceAddUniform "SS_JEDIBA_U";
};
if (typeOf player == "B_sniper_F") exitWith { 
player setVariable ["IMS_LaF_ShotsToTakeOutOneGuy",100,true]; ///Мастер
player setVariable ["LaF_HitCountToKill",3,true];
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
player forceAddUniform "SS_JEDIBA_U";
};
if (typeOf player == "I_Soldier_AR_F") exitWith { 
player setVariable ["IMS_LaF_ShotsToTakeOutOneGuy",100,true]; ///Серые джедаи
player setVariable ["LaF_HitCountToKill",3,true];
};
if (typeOf player == "I_Soldier_M_F") exitWith { 
player setVariable ["IMS_LaF_ShotsToTakeOutOneGuy",150,true]; /// Кредо-Данжен-Мастер
player setVariable ["LaF_HitCountToKill",5,true];
player addWeapon "LFP_lightsaber";
player addWeapon "LFP_lightsaber_Second";
};

