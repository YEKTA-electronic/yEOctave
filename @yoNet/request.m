function data = request(obj, url, params)
	% REQUEST - Single handler/dispatcher for all public url calls.
	%   data = obj.request(url)
	%   data = obj.request(url, params)

	if nargin < 3
		fullURL = url;
	else
		fullURL = obj.buildUrl(url, params);
	endif


	cmd = sprintf('curl -s -k %s %s %s "%s"',...
	obj.timeOut.str, obj.proxy.str, obj.resolver, fullURL);

	try
		tSend = tic();
		[status, response] = system(cmd);
		tPing = toc(tSend);
		tStr 	= sprintf("Time = %3.1f s",tPing);
		bStr 	= sprintf("Size = %5.2f KB",sizeof(response)/1024);
		you.logMe({'REQUEST',tStr,bStr})
	catch ME
		disp(lasterr)
		error('REQUEST|cURL|','GET failed for %s\n%s', url, ME.message);
	end

	% OS/system command/request function check
	if status != 0
		errorTxt = sprintf("ERROR | REQUEST | status = #%d & Responsed:\n%s",status)
		disp(response);
		error(errorTxt)
	end

	try
			result = jsondecode(response);
	catch
			error('JSON decoding error')
	end

  % ret val
  if numel(result) > 0
    data = you.toCellArray(result);% struct array
  else
    error('octAster:emptyResponse', 'Empty response from server');
  endif

end
