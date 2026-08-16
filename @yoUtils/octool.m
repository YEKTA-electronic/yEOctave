classdef octool
	properties
		name = string();
		root = string();
		main = string();
		date = int64(0);
		ignores = cell();
		pkgs = cell();
	endproperties

	methods
		function obj = octool(name,root)
			obj.date = now();% creation date
			if nargin<1
				obj.name = ['newOctaveProject_',int2str(obj.date)];% auto name
			endif
			if nargin<2
				obj.root = pwd;
			endif
		endfunction
	endmethods
endclassdef


