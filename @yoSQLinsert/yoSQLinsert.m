classdef yoSQLinsert < yoSQL
	properties
		query;
		into;% target
		default = logical(0);
		replace = logical(0);
		cols;
		values;% most important part
	endproperties
	%% METHODs :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	methods
		function obj = yoSQLinsert(tableName)
			obj.into = tableName;
		endfunction
	endmethods
endclassdef

