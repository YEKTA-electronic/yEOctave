% @yoNet/help.m
function help(obj)
  % HELP - print class usage and reference
  disp(' ')
  disp('========================================')
  disp('  yoNet  —  HTTP client via curl')
  disp('========================================')
  disp(' ')

  disp('PURPOSE:')
  disp('  REST API client using system curl; handles proxy, timeout,')
  disp('  DNS resolve, request building, JSON response -> struct array')
  disp(' ')

  disp('PROPERTIES:')
  disp('  name      : string  — instance label (log prefix)')
  disp('  proxy     : struct + str  — {protocol,host,port,str} or empty')
  disp('  timeOut   : struct + str  — {connection,max,str} or empty')
  disp('  ping      : struct        — {TF,delay,time} last ping result')
  disp('  resolver  : string        — raw --resolve "host:port:ip" or empty')
  disp(' ')

  disp('CONSTRUCTOR:')
  disp('  net = yoNet("name")')
  disp('    -> name assigned; proxy disabled; timeout disabled')
  disp(' ')

  disp('CONFIG METHODS:')
  disp('  net.setProxy()                     % disable')
  disp('  net.setProxy("on"/"off"/struct/cell/str)  % enable/configure')
  disp('  net.setTimeout(connSec, maxSec)    % 0=OS default; max=0 disables')
  disp('  net.setResolver("host:port:ip")    % raw curl --resolve string')
  disp(' ')

  disp('CORE METHOD:')
  disp('  data = net.request(url, params)')
  disp('    url    : base endpoint string')
  disp('    params : struct of key/value (appended as ?k=v&...)')
  disp('    return : cell array of structs (you.toCellArray(jsondecode))')
  disp(' ')

  disp('HELPERS:')
  disp('  net.buildUrl(base, paramsStruct)  -> full URL with query')
  disp('  net.pingTest()                    -> HEAD request, logs delay')
  disp('  you.errorTranslate(curlCode)      -> human string')
  disp(' ')

  disp('TYPICAL FLOW:')
  disp('  net = yoNet("tg");')
  disp('  net.setProxy("on");          % or struct/cell')
  disp('  net.setTimeout(5, 30);')
  disp('  data = net.request("https://api.telegram.org/bot<token>/getMe");')
  disp(' ')

  disp('LOGGING:')
  disp('  you.logMe, you.introduceObject, you.errorTranslate used internally')
  disp(' ')

  disp('REQUIREMENTS:')
  disp('  system curl in PATH; +you on path (urlEncoder, logMe, etc.)')
  disp(' ')
endfunction
