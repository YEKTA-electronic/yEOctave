function y = typeConverter (obj, x, outputDataType)
	switch (outputDataType)
		case 'string'
			if isempty(x)
				y = string();
			else
				y = string(strtrim(x));
			endif

		case 'int64'
			if isempty(x)
				y = int64(0);% null (NA/NaN) is not accepted for integer
			elseif isnumeric(x)
				y = int64(x);
			else
				y = int64(0);
			endif

		case 'double'
			if isempty(x)
				y = NA;
			elseif isnumeric(x)
				y = double(x);
			else
				y = NaN;
			endif

		case 'logical'
			if x
				y = logical(1);
			else
				y = logical(0);
			endif

		case 'numeric'

		case 'datetime'

		case 'categorical'

		case 'cell'
			if isempty(x)
				y = cell();
			elseif iscell(x)
				y = x;
			else
				y = {x};
			endif

		otherwise
			error('bad type')
	endswitch
endfunction
