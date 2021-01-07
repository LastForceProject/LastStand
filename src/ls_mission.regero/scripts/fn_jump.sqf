last_jump = player getVariable 'Last_Jump';
if (time - last_jump < 50) then
	{
	hint format ["Отдохни!"];
}
else
{

if ((vehicle player == player) && (uniform player in UsableUniformsJump) ) exitwith
{
	_vel = velocity player;
	_dir = direction player;
	_speed = 3.0;
	//playmusic "jump";
        player allowDamage false;
		player setVariable ["Last_Jump", time, true];
	player setVelocity [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed), 
		(_vel select 2) + 15
	];
	sleep 4;
        player allowDamage true;
	true
};
};