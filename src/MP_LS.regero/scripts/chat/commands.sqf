pvpfw_chatIntercept_allCommands = [
	[
		"help",
		{
			_commands = "";
			{
				_commands = _commands + (pvpfw_chatIntercept_commandMarker + (_x select 0)) + ", ";
			}forEach pvpfw_chatIntercept_allCommands;
			systemChat format["Available Commands: %1",_commands];
		}
	],
	[
		"jump",
		{player setVelocity [0,0,4]}
	],
	[
		"echo",
		{
			_argument = (_this select 0);
			systemChat format["Echo: %1",_argument];
		}
	],
	[
		"roll",
		{
			_rNumber = ceil random 100;
			_rShans = format["Удача благосклонна к %3 на %1%2",_rNumber, "%", name player];
			[_rShans] remoteExec ["systemChat"];
		}
	],
	[
		"s",
		{
			_bob1 = (_this select 0);
			_warning1 = format ["Игроку %1 выдан арма-страйк",_bob1];
			[_warning1] remoteExec ["systemChat"];
		}
	],
	[
		"w",
		{
			_bob2 = (_this select 0);
			_warning2 = format ["Игрок %1 нарушил правила сервера и получает предупреждение.(Выдал %2)",_bob2, name player];
			[_warning2] remoteExec ["systemChat"];
		}
	],
	[
		"try",
		{
			_bob3 = (_this select 0);
			_rrandom = selectRandom [1,2];
			if (_rrandom == 1) then {
			_vzlom = format ["%1 попытался взломать %2, его попытка неудачна!",name player,_bob3];
			[_vzlom] remoteExec ["systemChat"];}
			else {
			_vzlom = format ["%1 попытался взломать %2, его попытка успешна!",name player,_bob3];
			[_vzlom] remoteExec ["systemChat"];};
		}
	],
	[
		"crew",
		{
		_bob4 = (_this select 0);
		[] execVM "scripts\chat\crew.sqf";
		}
	],
	[
		"amstop",
		{
		_bob5 = (_this select 0);
		[] execVM "scripts\chat\amstop.sqf";	
		}
	],
	[
		"amstart",
		{
		_bob6 = (_this select 0);
		[] execVM "scripts\chat\amstart.sqf";
		}
	],
	[
        "me",
        {
        _bob7 = (_this select 0);
        _rpchat = format ["<t color='#FFFF00' size='1.2' valign=top align=right>%1:</t><t color='#CD5C5C' size='1.2' valign=top align=right>%2</t>",name player, _bob7];
        _rpsyschat = format ["RP сообщение от %1: %2",name player, _bob7];
        [[_rpchat,"PLAIN DOWN",2,false,true]] remoteExec ["titleText"];
        [_rpsyschat] remoteExec ["systemChat"];
        diag_log format ["rp_chat_message_from %1:%2",name player,_bob7];
        }
    ],
	[
		"mrk",
		{
		_bob5 = (_this select 0);
		[] execVM "scripts\chat\targetmarker.sqf";
		}
	]
];