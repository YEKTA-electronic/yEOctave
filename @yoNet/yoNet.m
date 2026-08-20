classdef yoNet

	properties(SetAccess=private)
		proxy;
	endproperties

	methods
		function obj = yoNet(protocol,host,port)

			if nargin == 0
				% DEFAULT = no proxy
				protocol 	= '';
				host			= '';
				port			= int64(0);
			endif

			obj.proxy = setfield(obj.proxy,"protocol",protocol);
			obj.proxy = setfield(obj.proxy,"host",host);
			obj.proxy = setfield(obj.proxy,"port",port);

			obj = obj.proxySet ('enable');

			you.introduceObject(obj);

		endfunction
	endmethods

endclassdef

