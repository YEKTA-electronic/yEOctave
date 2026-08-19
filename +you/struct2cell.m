function y = struct2cell(x,fieldFilter)
	% each struct is a row and each field is a column
	y = cell();% clean sheet

	if !isstruct(x)
		error('not struct input')
	elseif isempty(x)
		return;% no error no effort
	elseif nargin<3
		fieldFilter = fieldnames(x);% no filter defined
	elseif !iscell(fieldFilter)
		error('wrong filter input')
	endif

	colsNum = min(numfields(x),length(fieldFilter));
	for j=1:1:colsNum

		fieldName = fieldFilter{j};
		for i=1:length(x)

			value = x(i).(fieldName);
			if isempty(value)
				continue
			else
				y(i,j) = value;% put in the right place
			endif

		endfor%i

	endfor%j

endfunction
