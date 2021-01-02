_unit = _this select 0,
_type = _this select 1,

if (_type == "Smuggler") then {
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_rndUniform = [
  "SWOP_RebD_Drabata_rebelI_CombatUniform",
  "SWOP_RebDB_FDurosI_CombatUniform",
  "SWOP_RebDsvet_FDurosI_CombatUniform",
  "SWOP_RebD_FDurosI_CombatUniform",
  "SWOP_rebelsbr_FII_CombatUniform",
  "SWOP_RebDB_FII_CombatUniform",
  "SWOP_RebD_FII_CombatUniform",
  "SWOP_Reb_f_Kel_Dor2_CombatUniform",
  "SWOP_RebDB_FKI_CombatUniform",
  "SWOP_RebDB_FRI_CombatUniform",
  "SWOP_Trando_green_CombatUniform",
  "SWOP_RebDB_TwilekI_CombatUniform",
  "SWOP_RebDB_Twilek2I_CombatUniform",
  "SWOP_RebDB_vurkI_CombatUniform",
  "SWOP_Mercenario3_f_WW_weequay_CombatUniform",
  "SWOP_RebDB_weequay_rebelI_CombatUniform"]  call BIS_fnc_SelectRandom;
_unit forceAddUniform _rndUniform;



_rndVest = [
  "SWOP_RemBron2",
  "SWOP_RebSumkBron",
  "SWOP_RebSumkBronFull",
  "SWOP_Resistance_vestTroop",
  "V_BandollierB_cbr"]  call BIS_fnc_SelectRandom;
 

_unit addVest _rndVest;

_rndChance = random 100;
if (_rndChance >= 65) then {
_rndBb = [
  "SWOP_B_WoodBackpackS_Base",
  "SWOP_B_WoodBackpackSM_Base",
  "SWOP_B_WoodBackpacksS_Base",
  "OPTRE_UNSC_Rucksack_Heavy",
  "RD501_SWOP_B_SandBackpack_RTdv_Base"]  call BIS_fnc_SelectRandom;
_unit addBackpack _rndBb;
for "_i" from 1 to 2 do {_unit addItem "SWOP_termDet_G";};
_unit addItem "OPTRE_M2_Smoke";
};



[_unit,"Head_Weequay","mbg_alien_voice_02"] call BIS_fnc_setIdentity;


_rndWeapon = ["SW_Scattergun","SWOP_rt97cBlasterRifle","SWOP_rg4dPistol","SWOP_DL18Pistol","SWOP_DL44Pistol","SWLW_DC17","SCI_K16","SWOP_A280BlasterRifle","SWOP_DC15","SWLW_DC15A","SWLW_DC15AC","SWLW_ZH73","relbyv10"] call BIS_fnc_SelectRandom;
[_unit, _rndWeapon, 7] call BIS_fnc_addWeapon;

_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
_rndAnim = ["lightsaber_death_1","lightsaber_death_2","lightsaber_death_3","lightsaber_death_4","lightsaber_death_5","lightsaber_death_6","lightsaber_death_7","flamethrower_burning_6","flamethrower_burning_7"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
}];

};
