classdef yoPath
	properties
		dirRoot;
		dirExc = cell();% exclude pattern
		dirInc = cell();% to be added to the octaves Path
	endproperties
%% METHODs ::::::::::::::::::::::::::::::::::::::::::::::
	methods
		function obj = yoPath(rootFolder)
			if nargin<1
				rootFolder = pwd;% default
			endif
			obj.dirRoot = rootFolder;
		endfunction
	endmethods
endclassdef

