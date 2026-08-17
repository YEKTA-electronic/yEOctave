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
		function obj = yoPath(rootFolder,excList)
			isAuto = 0;
			% where the class is placed
			obj.dirMain = fileparts(__FILE__);

			if nargin==0
				% default mode
				rootFolder = pwd;
			elseif nargin == 1
				% manual mode
				obj.dirRoot = rootFolder;
				obj.dirExc = cell();
			elseif nargin == 2
				% auto mode
				obj.dirRoot = rootFolder;
				obj.dirExc = excList;
				isAuto = 1;
			else
				error('yoPath | bad init')
			endif

			if isAuto
				obj.dirFind = obj.search();
				obj.dirInc = obj.filter();
				obj.add();
			endif

		endfunction
	endmethods
endclassdef

