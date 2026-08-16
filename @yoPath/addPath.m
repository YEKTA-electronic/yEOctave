function addPath(obj)
	% convert back to char/string
	pathStr = strjoin(obj.dirInc,';');
	% apply
	addpath(pathStr);
	rehash();
	disp('All those path are added now')
endfunction
