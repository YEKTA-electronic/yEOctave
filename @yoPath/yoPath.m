classdef yoPath
	properties
		dirRoot;
		dirMain;
		dirFind;% all the found path after search
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
			obj.dirMain = fileparts(__FILE__);

		endfunction
	endmethods
endclassdef

