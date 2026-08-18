% convert any kind of input date into formated string
function s = buildRows (obj,x)

	rowStrings = cell();% clean sheet
	if iscell(x)
		iRows = rows(x);
		jCols = min(columns(x),length(obj.cols));
		for i=1:iRows % each row...
			rowValues = cell();
			for j=1:jCols % then each column element
				value = x{i,j};
				rowValues{j} = obj.scalar2str(value);
			endfor%j
			% all the values for a row is read
			rowStrings{i} = ['(', strjoin(rowValues,','), ')'];
		endfor%i
		s = strjoin(rowStrings,',');

	elseif isstruct(x)
		% each struct is a row and each field is a column
		iRows = length(x);
		jCols = min(numfields(x),length(obj.cols))
		% refine the field orders and convert to Cell array
		newCell = cell();
		for j=1:jCols
			fieldName = obj.cols{j};
			for i=1:iRows
				newCell(i,j) = x(i).(fieldName);% put in the right place
			endfor%i
		endfor%j
		s = obj.buildRows(newCell);% RECURSIVE call

	else
		error('INSERT | wrong input VALUE(s)')
	endif

endfunction
