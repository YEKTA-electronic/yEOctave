% convert fields into string
function retString = build (obj)
	% REPLACE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if obj.replace
		insertStr = 'INSERT OR REPLACE INTO ';
	else
		insertStr = 'INSERT INTO ';
	endif
	insertStr = [insertStr,obj.table];
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
	% VALUES :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if obj.default
		useDefault = true;
	elseif isempty(obj.values)
		useDefault = true;
	else
		useDefault = false;
		if ischar(obj.values)
			% written for DIRECT use
			valStr = ['("',obj.values,'")'];
		else
			% needs conversion...
			valStr = obj.buildRows (obj.values);
		end
		valStr = ['VALUES ',valStr];% helper
	endif

	% concatenator :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if useDefault
		retString = ['INSERT INTO ',obj.table,' DEFAULT VALUES'];
	else
		retString = strjoin({insertStr,colStr,valStr},' ');
	end
	%retString = [retString,' RETURNING *']
endfunction
