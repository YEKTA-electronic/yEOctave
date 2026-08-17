function retStr = build_set(obj)

	setStr = cell();
	if iscell(obj.setPair)
		% each row is a pair of Name-Value in the table
		for i=1:rows(obj.setPair)
			colName = obj.setPair{i,1};
			colValue = obj.scalar2str(obj.setPair{i,2});
			setStr(i) = sprintf('%s=%s', colName, colValue);
		endfor%i

	elseif isstruct(obj.setPair)
		colName = fieldnames(obj.setPair);

		for i=1:numfields(obj.setPair)
			colValue = obj.setPair.(colName{i});
			colValue = obj.scalar2str(colValue);
			setStr(i) = sprintf('%s=%s', colName{i}, colValue);
		endfor
	else
		error('wrong input')
	endif

	retStr = ['SET ',strjoin(setStr,',')];

endfunction

