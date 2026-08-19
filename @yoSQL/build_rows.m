% convert any kind of input date into formated string
function s = build_rows (obj,x)

	if iscell(x)
		iRows = rows(x);
		jCols = min(columns(x),length(obj.cols));
		rowStrings = cell();% clean sheet
		for i=1:iRows % each row...
			rowValues = cell();
			for j=1:jCols % then each column element
				value = x{i,j};
				%rowValues{j} = obj.scalar2str(value);
				rowValues{j} = you.scalar2str(value);
			endfor%j
			% all the values for a row is read
			rowStrings{i} = ['(', strjoin(rowValues,','), ')'];
		endfor%i
		s = strjoin(rowStrings,',');

	elseif isstruct(x)

		newCell = you.struct2cell (x,obj.cols);
		s = obj.build_rows(newCell);% RECURSIVE call

	else
		error('INSERT | wrong input VALUE(s)')
	endif

endfunction
