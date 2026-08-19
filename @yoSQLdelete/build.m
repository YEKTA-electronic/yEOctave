% convert fields into string
function retString = build (obj)
	% DELETE :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if ischar(obj.from)
		delStr = ['DELETE FROM ',strtrim(obj.from)];
	else
		error('bad FROM TABLE for DELETE object')
	endif

	% SELECT :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if isempty(obj.select)
		selStr='';% no select
	elseif ischar(obj.select)
		selStr = ['(SELECT ',obj.select,')'];
	else
		error('bad SELECT for DELETE object')
	endif

	whereStr=obj.build_where;
	% concatenator :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	retString = strjoin({delStr,whereStr,selStr},' ');
endfunction

