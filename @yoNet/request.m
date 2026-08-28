function data = request(obj, url, params)
% REQUEST - Single handler/dispatcher for all public url calls.

	if nargin < 3
		params = struct();% no extra parameters
	endif

	fullURL = buildUrl(url, params);
	cmd = sprintf('curl -s -k %s %s %s "%s"',...
	obj.timeOut.str, obj.proxy.str, obj.resolver, fullURL);

	try
		tSend = tic();
		[status, response] = system(cmd);
		% successful cURL
		tPing = toc(tSend);
		tStr 	= sprintf("Time = %1.0f ms",tPing*1000);
		bStr 	= sprintf("Size = %5.2f KB",sizeof(response)/1024);
		you.logMe({obj.name,'REQUEST',tStr,bStr})
	catch ME
		disp(lasterr)
		you.logMe({obj.name,'REQUEST','cURL FAILED'});
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
% LOCAL functions ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
function retURL = buildUrl(url, params)
% BUILDURL - Construct full URL with optional query parameters
%   params: struct of key/value pairs
		if nargin<2
			% no params
			retURL = url;% nothing to do

		elseif isempty(params) || isempty(fieldnames(params))
			% no params provided
			retURL = url;

    else
			fields 	= fieldnames(params);
			query 	= cell(1, length(fields));

			for i = 1:length(fields)
					v = params.(fields{i});
					if isnumeric(v)
							v = num2str(v);
					end
					query{i} = sprintf('%s=%s', fields{i}, v);
			end

			retURL = [url,'?', strjoin(query,'&') ];
    end
end
