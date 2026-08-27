classdef yoSQL

		properties (SetAccess = private)
			link;
			path;
			tik;% connection timer
			mode = false;% connection status
		endproperties

		methods
			% constructor ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			function obj = yoSQL(dbFile)
				if nargin==0
					disp('PARENTING | new child born')
				else
					obj.path = dbFile;
				endif
			endfunction

    endmethods

endclassdef


