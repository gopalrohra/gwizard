function gw_back(url){if(before_back()){location.href=url;}}
function gw_next(url){if(before_next()){location.href=url;}}
function gw_skip(url){if(before_skip()){location.href=url;}}
function gw_finish(url){if(before_finish()){location.href=url;}}
function before_back(){/*write your custom code here...*/return true;}
function before_next(){/*write your custom code here...*/return true;}
function before_skip(){/*write your custom code here...*/return true;}
function before_finish(){/*write your custom code here...*/return true;}