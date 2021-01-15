_veh = _this select 0;

if ((player distance _veh) <= 2000) then {
sleep 0.5;
enableCamShake true;
addCamShake [1,4,27];
if (vehicle player != player) then {
playSound ["emp_plr",true];
vehicle player setHitPointDamage ["hitEngine",1];
vehicle player setHitPointDamage ["HitAvionics",1];
vehicle player setHitPointDamage ["HitBatteries",1];
vehicle player setHitPointDamage ["HitLight ",1];
vehicle player disableTIEquipment true;
vehicle player disableNVGEquipment true;
}else{
playSound "emp_plr";
};
if (player isKindOf "MAN") then {
_unit_afect = player;
_bbr = boundingBoxReal vehicle _unit_afect;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
	_e_static = "#particlesource" createVehicleLocal (getPos _unit_afect);
	_e_static setParticleCircle [0,[0,0,0]];
	_e_static setParticleRandom [0.2,[_maxWidth/4,_maxLength/4,_maxHeight],[0,0,0],0,0.001,[0,0,0,1],1,0];
	_e_static setParticleParams [["\A3\data_f\blesk1",1,0,1],"","SpaceObject",1,0.2,[0,0,0],[0,0,0],0,10,7.9,0,[0.002,0.002],[[1,1,0.1,1],[1,1,1,1]],[0.08], 1, 0, "", "", _unit_afect];
	_e_static setDropInterval 0.01;
	[_e_static] spawn {_de_sters = _this select 0;sleep 1;deleteVehicle _de_sters};
}else{
_unit_afect = player;
_bbr = boundingBoxReal vehicle _unit_afect;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
	_e_car = "#particlesource" createVehicleLocal (getPos _unit_afect);
	_e_car setParticleCircle [_maxWidth-0.5,[0,0,0]];
	_e_car setParticleRandom [0.2,[0.2,0.2,_maxHeight/2-0.5],[0,0,0],0,0.02,[0,0,0,1],1,0];
	_e_car setParticleParams [["\A3\data_f\blesk1",1,0,1],"","SpaceObject",1,0.2,[0,0,0],[0,0,0],0,10,7.9,0,[0.003,0.003],[[1,1,0.1,1],[1,1,1,1]],[0.08], 1, 0, "", "", _unit_afect];
	_e_car setDropInterval 0.01;
	[_e_car] spawn {_de_sters = _this select 0;sleep 1;deleteVehicle _de_sters};

};
[0] spawn {
 sleep 1;
 cutText ["", "WHITE OUT", 1];
 sleep 0.1;
 titleCut ["", "WHITE IN", 1];
 "dynamicBlur" ppEffectEnable true;
 "dynamicBlur" ppEffectAdjust [5];
 "dynamicBlur" ppEffectCommit 0;
 sleep 1;
 "dynamicBlur" ppEffectAdjust [1];
 "dynamicBlur" ppEffectCommit 1;
 sleep 5;
 playsound "tiuit";
 "dynamicBlur" ppEffectAdjust [0];
 "dynamicBlur" ppEffectCommit 10;
 sleep 10;
 "dynamicBlur" ppEffectEnable false;
};
};
if ((player distance _veh) <= 2000) then {
    _obj_emp = _veh;
	_ripple = "#particlesource" createVehicleLocal getposatl _obj_emp;
	_ripple setParticleCircle [0,[0,0,0]];
	_ripple setParticleRandom [0,[0.25,0.25,0],[0.175,0.175,0],0,0.25,[0,0,0,0.1],0,0];
	_ripple setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0],0,10,7.9,0, [30,1000], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj_emp];
	_ripple setDropInterval 0.1;
	[_ripple] spawn {_de_sters = _this select 0;sleep 1;deleteVehicle _de_sters};

	_blast = "#particlesource" createVehicleLocal getposatl _obj_emp;
	_blast setParticleCircle [0, [0, 0, 0]];
	_blast setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
	_blast setParticleParams [["\A3\data_f\koule", 1, 0, 1], "", "SpaceObject", 1,1,[0,0,0],[0,0,1],3,10,7.9,0,[50,1000],[[1, 1, 1, 0.1], [1, 1, 1, 0]], [1], 1, 0, "", "", _obj_emp];
	_blast setDropInterval 50;
	[_blast] spawn {_de_sters = _this select 0;sleep 1;deleteVehicle _de_sters};

	_light_emp = "#lightpoint" createVehiclelocal getposatl _obj_emp;
	_light_emp lightAttachObject [_obj_emp, [0,0,3]];
	_light_emp setLightAmbient [1,1,1];
	_light_emp setLightColor [1,1,1];
	_light_emp setLightBrightness 0;
	_light_emp setLightDayLight true;
	_light_emp setLightAttenuation [10,10,50,0,50,2000];
	_range_lit=0;
	_brit = 0;
	while {_brit < 50} do
	{
		_light_emp setLightBrightness _brit;
		_brit = _brit+2;
		sleep 0.01;
	};
	deleteVehicle _light_emp;
};
