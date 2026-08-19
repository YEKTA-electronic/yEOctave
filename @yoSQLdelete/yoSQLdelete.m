classdef yoSQLdelete < yoSQL
	properties
		query;
		from;
		where;
		select;
		limit=0;
		offset=0;
	endproperties
	%% METHODs :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	methods
		function obj = yoSQLdelete(tableName)
			obj.from = tableName;
		endfunction
	endmethods
endclassdef

