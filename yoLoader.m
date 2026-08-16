function yoLoader(rootPath)
	% first add all my own helpers
	yeOctaveDir = fileparts(__FILE__);
	yoPathDir = [yeOctaveDir,'\@yoPath'];
	addpath(yoPathDir);
	% use the class PATH HELPER
	pObj = yoPath(yeOctaveDir);
	pObj.dirExc = {'trash','arx','ignore','hid','.git'};
	pObj = pObj.search();% find all the existing and Excluding folders
	pObj.addPath();
endfunction

function pathIncluder(myPath)

	% convert back to char/string
	pStr = strjoin(pList,pathsep);
	% apply
	addpath(pStr);
	% report
	pCell = strsplit(path(),';');
	for i=1:numel(pCell)
		disp([num2str(i),': ',pCell{i}])
	endfor
	disp('All those path are added now')
endfunction
