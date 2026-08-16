classdef yoSQL
		properties (SetAccess = private)
			link;
			tik;
		endproperties
    properties (SetAccess = public)
			path
			mode
    end
    methods
			% constructor ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			function obj = yoSQL(mode,path)
				if nargin==0
					disp('PARENTING | new child born')
				else
					obj.mode = mode;
					if nargin > 1
						obj.path = path;
					elseif strcmp(mode,'create')
						obj.path = ['database_yosql_',int2str(time()),'.db'];
					end
					obj = obj.connect();
				endif
			endfunction
    endmethods
endclassdef


