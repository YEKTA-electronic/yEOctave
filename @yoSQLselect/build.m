% convert fields into string
function retString = build (obj)
	% SELECT :::::::::::::::::::::::::::::::::::::::::::::::::
	if iscell(obj.colNames)
		selectCols = strjoin(obj.colNames,',');
	elseif ischar(obj.colNames)
		selectCols = obj.colNames;
	elseif isempty(obj.colNames)
		warning('SELECT everything')
		selectCols = '*';
	else
		error('SELECT | wrong SELECT clause')
	endif

	if obj.distinct
		selectStr = ['SELECT DISTINCT ',selectCols];
	else
		selectStr = ['SELECT ',selectCols];
	endif
	% FROM :::::::::::::::::::::::::::::::::::::::::::::::::::
	if iscell(obj.from)
		fromSrc = strjoin(obj.from,',');
	elseif ischar(obj.from)
		fromSrc = obj.from;
	else
		error('bad FROM phrase')
	endif
	fromStr = ['FROM ',fromSrc];
	% WHERE ::::::::::::::::::::::::::::::::::::::::::::::::::
	if isempty(obj.where)
		whereStr = '';
	elseif ischar(obj.where)
		whereStr = ['WHERE (',strtrim(obj.where),')'];
	else
		error('SELECT | wrong WHERE clause')
	endif
	% ORDER ::::::::::::::::::::::::::::::::::::::::::::::::::
	if isempty(obj.order)
		orderStr = '';% no Sort & Limit
	else

		if iscell(obj.order)
			orderCols = strjoin(obj.order,',');
		elseif ischar(obj.order)
			orderCols = obj.order;
		else
			error('bad ORDER BY phrase')
		endif

		if obj.nullsFirst
			orderNulls = 'LAST';
		else
			orderNulls = 'FIRST';% naturally default
		end

		if obj.limit>0 && obj.offset>0
			orderStr = sprintf("ORDER BY %s NULLS %s LIMIT %d OFFSET %d",orderCols,orderNulls,obj.limit,obj.offset);
		elseif obj.limit>0
			orderStr = sprintf("ORDER BY %s NULLS %s LIMIT %d",orderCols,orderNulls,obj.limit);
		else
			orderStr = sprintf("ORDER BY %s NULLS %s",orderCols,orderNulls);
		endif

	endif
	% concatenator :::::::::::::::::::::::::::::::::::::::::::
	retString = strjoin({selectStr,fromStr,whereStr,orderStr},' ');
endfunction
