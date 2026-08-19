% convert fields into string
function retString = build (obj)

	if iscell(obj.colNames)
		selectCols = strjoin(obj.colNames,',');

	elseif ischar(obj.colNames)
		selectCols = obj.colNames;

	elseif isempty(obj.colNames)
		selectCols = '*';% default mode

	else
		error('SELECT | wrong SELECT clause')
	endif

	if obj.distinct
		selectStr = ['SELECT DISTINCT ',selectCols];
	else
		selectStr = ['SELECT ',selectCols];
	endif
	%% other parts :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	fromStr 	= obj.build_from;
	orderStr 	= obj.build_order;
	whereStr 	= obj.build_where;
	% concatenator :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	retString = strjoin({selectStr,fromStr,whereStr,orderStr},' ');
endfunction
