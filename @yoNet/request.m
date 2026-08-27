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
		you.logMe({obj.name,'REQUEST',tStr,bStr})
	catch ME
		disp(lasterr)
		you.logMe({obj.name,'REQUEST','cURL','FAILED'});
		disp([url;ME.message]);
		error(lasterr)
	end

	% OS/system command/request function check
	if status != 0
		disp(sprintf("Responsed:\n%s",response));
		errorTxt = sprintf("Status ERROR code=%d: %s",status, you.errorTranslate(status));
		disp(errorTxt)
		error(lasterr)
	end

	try
			result = jsondecode(response);
	catch
			disp('JSON decoding error')
			error(lasterr)
	end

  % ret val
  if numel(result) > 0
    data = you.toCellArray(result);% struct array
  else
    disp('octAster:emptyResponse', 'Empty response from server');
		error(lasterr)
  endif

end
