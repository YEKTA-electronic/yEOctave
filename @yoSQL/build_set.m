function retStr = build_set(obj)
% convert the property to pairs of "name1=value1, name2=value2" as a string
	setStr = cell();

	%% CELL input ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if iscell(obj.setPair)
		% each row is a pair of Name-Value in the table
		for i=1:rows(obj.setPair)
			colName = obj.setPair{i,1};
			colValue = you.scalar2str(obj.setPair{i,2});
			setStr(i) = sprintf('%s=%s', colName, colValue);
		endfor

	%% STRUCT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	elseif isstruct(obj.setPair)
		colName = fieldnames(obj.setPair);

		for i=1:numfields(obj.setPair)
			colValue = obj.setPair.(colName{i});
			colValue = obj.scalar2str(colValue);
			setStr(i) = sprintf('%s=%s', colName{i}, colValue);
		endfor

	%% FAIL ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	else
		error('wrong input')
	endif

	retStr = ['SET ',strjoin(setStr,',')];

endfunction
