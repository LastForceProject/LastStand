private _var = missionNamespace getVariable "rpchat";
if(isNil "_var")then{
  _varText = format["<t align=centre>%1<br/></t>",date];
  publicVariable _varText;
  missionNamespace setVariable ["rpchat",_varText,true];
}else{};