function retStr = build_from (obj)

	if ischar(obj.from)
		fromSrc = obj.from;

	elseif iscell(obj.from)
		fromSrc = strjoin(obj.from,',');

	else
		error('bad FROM phrase')
	endif

	retStr = ['FROM ',fromSrc];

endfunction
