classdef yoSQL
		% internal Vars
		properties GetAccess = private
			path;
			link;
			query;
		endproperties
		% visible Vars
		properties (SetAccess = private)
			tik;% connection timer
			mode = false;% connection status
			result;% direct result of running this query in "sqlite" package
		endproperties
		% accessible Vars
		properties (public)
			% target
			from;% DELETE from
			into;% INSERT into
			table;% UPDATE table
			cols = '*';% SELECT dafault all columns OR {'name1','name2',...} OR {(name1,type1),(name2,type2),...}
			% conditioned
			where = '';
			order = '';% not sorted
			limit = int64(0);% ALL as default
			offset = int64(0);% from begining
			nullsLast = logical(0);% FIRST as default
			% data
			setPair;
			default = logical(0);% INSERT not defined vars
			replace = logical(0);% INSERT OR REPLACE
			values;% most important part

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
