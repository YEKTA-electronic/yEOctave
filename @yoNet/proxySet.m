function obj = proxySet (obj,prx)
% STRUCT for set new config by fields
% STRING for DIRECT set
	if isempty(prx)
		error('bad proxy')

	elseif ischar(prx)
		% direct set
		switch(prx)
			case {'off','no','disable',0,false}
				obj.proxy.str = '';% clean
			case {'on',1,true,'enable','set'}
				obj.proxy.str = proxy2str(obj.proxy);% build & set
			otherwise
				obj.proxy.str = strtrim(prx);% custom
		endswitch

	elseif isstruct(prx)
		% no problem found
		% save...
		if isfield(prx,'protocol')
			obj.proxy.protocol = prx.protocol;
		endif
		if isfield(prx,'host')
			obj.proxy.host = prx.host;
		endif
		if isfield(prx,'port')
			obj.proxy.port = prx.port;
		endif
		% set the new config...
		obj.proxy.str = proxy2str(obj.proxy);% build & set

	endif
	disp(obj.proxy.str)

endfunction
%% LOCAL FUNCTIONs :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
function proxyString = proxy2str(x)
	% x is proxyStruct
	proxyString = sprintf('--%s-hostname %s:%d',x.protocol,x.host,x.port);
endfunction
