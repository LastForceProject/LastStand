while {true} do 
{
private ["_reserved_units_jedi", "_reserved_uids","_reserved_uids_jedi","_reserved_uids_jedi_g","_reserved_units_jedi_g","_reserved_units_jedi_g","_reserved_uid_kredo", "_uid"];

waitUntil {!isNull player};
waitUntil {(vehicle player) == player};
waitUntil {(getPlayerUID player) != ""};


_reserved_units_jedi = [Jedi_1,Jedi_2,Jedi_3,Jedi_4,Jedi_5,Jedi_6,Jedi_7,Jedi_8,Jedi_9,Jedi_10,Jedi_11,Jedi_12,Jedi_13,Jedi_14,Jedi_15,Jedi_16,Jedi_17,Jedi_18,Jedi_19,Jedi_20,Jedi_21];
_reserved_units_jedi_g = [g_jedi_1,g_jedi_2,g_jedi_3,g_jedi_4,g_jedi_5,g_jedi_6,g_jedi_7,g_jedi_8,g_jedi_9,g_jedi_10];
_reserved_unit_kredo = [Kredo];


_reserved_uids_jedi = 
[
"76561198182854197",//YokaEnnera
"76561198351130485",//Bybyluka,
"76561198134986244",//Weiss
"76561199028516754",//Desire
"76561198263487246",//Taul 
"76561198286850470",//Solus
"76561198079947268",//Horus
"76561198053039579",//Kos
"76561198089050684",//Eran
"76561198195500471",//Chet
"76561198307319806",//Castel
"76561198971806860",//Neon
"76561198092314817",//Zander
"76561198297807448",//Redad
"76561198303259241",//Yota
"76561198077225328",//Morgul
"76561198403863023",//Grace
"76561198218155392",//Kevju
"76561198215383007",//Blade
"76561198384407714",//Clever
"76561198177866047",//Black
"76561198144015474",//Kelt
"76561198054599597",//Olaf
"76561198356369417",//Keyd
"76561198801222573",//Valeska
"76561198166448129",//Kira
"76561198102983006",//Joker
"76561198309313248",//Thorin
"76561198084192447",//Irai
"	76561198136308916"//Gorza
"76561198058754300",//Zig Stroi
];
_reserved_uids_jedi_g = [
"76561198053534432",//Marr (XUI KREDO VO RTU)
"76561198150488400",//Mephisto(Svez)
"76561198045507912",//August(Dolbaeb blyat)
"76561199028516754"//Desire
];
_reserved_uid_kredo = [
"76561198121927537"//Kredo
];

_uid = getPlayerUID player;


if ((player in _reserved_units_jedi)&& !(_uid in _reserved_uids_jedi)) then 
{
  titleText ["", "BLACK OUT"];
  disableUserInput true;
  hint "Этот слот нельзя занять, вы будете отправлены в лобби через 15 секунд!";
  sleep 5;
  hint "Этот слот нельзя занять, вы будете отправлены в лобби через 10 секунд!";
  sleep 5;
  hint "Этот слот нельзя занять, вы будете отправлены в лобби через 5 секунд!";
  sleep 5;
  titleText ["", "BLACK IN"];
  disableUserInput false;
  failMission "end1";
  	};  
if ((player in _reserved_unit_kredo)&& !(_uid in _reserved_uid_kredo)) then 
{
  titleText ["", "BLACK OUT"];
  disableUserInput true;
  hint "Этот слот нельзя занять, вы будете отправлены в лобби через 15 секунд!";
  sleep 5;
  hint "Этот слот нельзя занять, вы будете отправлены в лобби через 10 секунд!";
  sleep 5;
  hint "Этот слот нельзя занять, вы будете отправлены в лобби через 5 секунд!";
  sleep 5;
  titleText ["", "BLACK IN"];
  disableUserInput false;
  failMission "end1";
  	};  
if ((player in _reserved_units_jedi_g)&& !(_uid in _reserved_uids_jedi_g)) then 
{
  titleText ["", "BLACK OUT"];
  disableUserInput true;
  hint "Этот слот нельзя занять, вы будете отправлены в лобби через 15 секунд!";
  sleep 5;
  hint "Этот слот нельзя занять, вы будете отправлены в лобби через 10 секунд!";
  sleep 5;
  hint "Этот слот нельзя занять, вы будете отправлены в лобби через 5 секунд!";
  sleep 5;
  titleText ["", "BLACK IN"];
  disableUserInput false;
  failMission "end1";
  	};  
};