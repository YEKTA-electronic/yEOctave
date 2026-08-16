function obj = dirIgnore(obj,folderNames)
	if nargin == 0
		% defaults
		obj.ignores = {'.git','trash','arx','ignore','hidden','skip','temp'};
	else
		n = numel(obj.ignores)+1;
		for i=1:numel(folderNames)
			obj.ignores{i+n} = folderNames{i};% insert
		endfor
	endif

endfunction

