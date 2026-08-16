% convert fields into string
function retString = build (obj)
	% DELETE :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if ischar(obj.table)
		delStr = ['DELETE FROM ',strtrim(obj.table)];
	else
		error('bad FROM TABLE for DELETE object')
	endif

	% WHERE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if ischar(obj.where)
		whereStr = ['WHERE ',strtrim(obj.where)];
	else
		error('bad WHERE claue for DELETE object')
	endif

	% SELECT :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if isempty(obj.select)
		selStr='';% no select
	else
		if ischar(obj.select)
			selStr = ['(SELECT ',obj.select,')'];
		else
			error('bad SELECT for DELETE object')
		endif

	endif
	% concatenator :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	retString = strjoin({delStr,whereStr,selStr},' ');
endfunction

