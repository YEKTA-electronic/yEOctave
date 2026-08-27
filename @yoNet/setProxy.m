function obj = setProxy (obj,prx)
% STRUCT/CELL for set new config by fields
% STRING for DIRECT set
% LOGIC for Enable/Disable

	if nargin<2
		% no input arg.
		obj.proxy = struct();% clear
		obj.proxy = setfield(obj.proxy,"protocol",	'');
		obj.proxy = setfield(obj.proxy,"host",			'');
		obj.proxy = setfield(obj.proxy,"port",			0);
		obj.proxy = setfield(obj.proxy,"str",			'');
		% log
		you.logMe ({obj.name,'No proxy'})

	elseif isstruct(prx)
		% save...
		obj.proxy = prx;
		obj.proxy.str = proxy2str(obj.proxy);% build & set
		% log
		you.logMe ({obj.name,obj.proxy.str,'new proxy is Set & Enabled'})

	elseif iscell(prx)
		% just in order...
		obj.proxy.protocol 	= prx{1};
		obj.proxy.host 			= prx{2};
		obj.proxy.port 			= prx{3};
		obj.proxy.str 			= proxy2str(obj.proxy);% build & set
		you.logMe ({obj.name,obj.proxy.str,'new proxy is Set & Enabled'})

	elseif ischar(prx) || isnumeric(prx) || isbool(prx)
		% direct set
		switch(prx)
			case {0,false,'off','no','disable'}
				obj.proxy.str = '';% clean
				you.logMe ({obj.name,'proxy Disabled'})

			case {1,true,'on','enable','set'}
				obj.proxy.str = proxy2str(obj.proxy);% build & set
				you.logMe ({obj.name,obj.proxy.str,'new proxy is Set & Enabled'})

			otherwise
				obj.proxy.str = strtrim(prx);% custom
				you.logMe ({obj.name,obj.proxy.str,'new proxy is Set & Enabled'})
		endswitch

	endif

endfunction
%% LOCAL FUNCTIONs :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
function proxyString = proxy2str(x)
	% x is proxyStruct
	if isempty(x.protocol)
		proxyString =''

	else
		proxyString = sprintf('--%s-hostname %s:%d',x.protocol,x.host,x.port);
	endif

endfunction
