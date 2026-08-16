classdef yoSQLinsert < yoSQL
	properties
		query;
		table;% target
		default = logical(0);
		replace = logical(0);
		cols;
		values;% most important part
	endproperties
	%% METHODs :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	methods
		function obj = yoSQLinsert(into)
			obj.table = into;
		endfunction
	endmethods
endclassdef

