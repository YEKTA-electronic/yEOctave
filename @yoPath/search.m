function pathList = search(obj)
	ps = genpath(obj.dirRoot);% [string]
	pathList = strsplit(ps,";");% convert to cell array
	% report
	disp(['Folders found: ',int2str(numel(pathList))])
endfunction

