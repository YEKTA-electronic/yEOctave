function retStr = build_set(obj)

	setStr = cell();
	if iscell(obj.setPair)
		% each row is a pair of Name-Value in the table
		for i=1:rows(obj.setPair)
			colName = obj.setPair{i,1};
			colValue = obj.scalar2str(obj.setPair{i,2});
			setStr(i) = sprintf('%s=%s', colName, colValue);
		endfor%i
	else
		error('wrong input')
	endif

	retStr = ['SET ',strjoin(setStr,',')];

endfunction

