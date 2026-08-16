classdef yoSQLdelete < yoSQL
	properties
		query;
		table;
		where;
		select;
		limit=0;
		offset=0;
	endproperties
	%% METHODs :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	methods
		function obj = yoSQLdelete(from)
			obj.table = from;
		endfunction
	endmethods
endclassdef

