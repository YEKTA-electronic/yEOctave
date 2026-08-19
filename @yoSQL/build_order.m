function retStr = build_order(obj)

	if isempty(obj.order)
		retStr = '';% no Sort & Limit
		return
	endif

		if iscell(obj.order)
			orderCols = strjoin(obj.order,',');
		elseif ischar(obj.order)
			orderCols = obj.order;
		else
			error('bad ORDER BY phrase')
		endif
		retStr = ["ORDER BY ",orderCols];

		if isprop(obj, 'nullsFirst')
			if obj.nullsFirst
				orderNulls = 'LAST';
			else
				orderNulls = 'FIRST';% naturally default
			end
			retStr = [retStr," NULLS ",orderNulls];
		endif

		if obj.limit>0 && obj.offset>0
			retStr = sprintf("%s LIMIT %d OFFSET %d",retStr,obj.limit,obj.offset);
		elseif obj.limit>0
			retStr = sprintf("%s LIMIT %d",retStr,obj.limit);
		endif

endfunction

