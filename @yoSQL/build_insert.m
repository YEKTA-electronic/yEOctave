% convert fields into string
function retString = build (obj)
	% REPLACE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if obj.replace
		insertStr = 'INSERT OR REPLACE INTO ';
	else
		insertStr = 'INSERT INTO ';
	endif
	insertStr = [insertStr,obj.into];

	% VALUES :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if obj.default || isempty(obj.values)
		retString = [insertStr,' DEFAULT VALUES'];
		return;% EXIT---------------------------------------------------------------

	elseif ischar(obj.values)
			% written for DIRECT use
			valStr = ['("',obj.values,'")'];
	else
			% needs conversion...
			valStr = obj.build_rows (obj.values);
	endif
	valStr = ['VALUES ',valStr];% helper

	% COLUMNs ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if isempty(obj.cols)
		colStr = '';
	elseif iscell(obj.cols)
		colStr = ['(',strjoin( obj.cols,','),')'];
	elseif ischar(obj.cols)
		colStr = sprintf("(%s)",obj.cols);
	else
		error('wrong input ')
	endif

	% concatenator :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	retString = strjoin({insertStr,colStr,valStr},' ');

endfunction
