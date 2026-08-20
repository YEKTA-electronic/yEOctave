function data = request(obj, url, params)
	% REQUEST - Single handler/dispatcher for all public url calls.
	%   data = obj.request(url)
	%   data = obj.request(url, params)

	if nargin < 3
			params = struct();
	endif

	fullURL = obj.buildUrl(url, params);
	cmd = sprintf('curl -s -k %s "%s"', obj.proxy.str, fullURL);

	try
		tSend = tic();
		[status, response] = system(cmd);
		tPing =toc(tSend);
		disp(['REQUEST | Time: ', num2str(tPing,"%3.1f"), ' Sec'])
		disp(['REQUEST | Size: ', int2str(sizeof(response)), ' Bytes'])
	catch ME
		error('REQUEST|cURL|','GET failed for %s\n%s', url, ME.message);
	end

	% OS/system command/request function check
	if status != 0
		errorTxt = sprintf("ERROR | REQUEST | status = #%d & Responsed:\n%s",status,response);
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
