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