function obj = pingTest (obj)
% checks if the net object could reach internet
  testUrl = 'https://8.8.8.8/';
	null_device = ifelse(ispc(), 'NUL', '/dev/null');% With this (works on both OS):

	cmd = sprintf('curl -s -k -o %s -w "%%{http_code}" %s %s %s "%s"', ...
	null_device, obj.timeOut.str, obj.proxy.str, obj.resolver, testUrl);
% test and record
	pingDelay = tic;
	try
		[status, output] = system(cmd);
		pingDelay = toc(pingDelay);
	catch
		pingDelay = -1;
	end_try_catch
	httpCode = str2double(output);
% report
	obj.ping.time = int64(time());
	obj.ping.delay = pingDelay;

	if (pingDelay>=0) && (status == 0) && (~isempty(output)) && (httpCode>= 200 && httpCode<=400)
    obj.ping.TF   = true;
    you.logMe({obj.name, 'PING', sprintf('%2.0f ms', pingDelay*1000)});
  else
    obj.ping.TF   = false;
    you.logMe({obj.name, 'ping', 'FAIL', you.errorTranslate(status)});
  endif

endfunction

