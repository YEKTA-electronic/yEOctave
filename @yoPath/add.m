function add(obj)
	% convert back to char/string
	pathStr = strjoin(obj.dirInc,';');
	% apply
	addpath(pathStr);
	rehash();
	disp('All the INCLUSION list paths are added now')
endfunction
