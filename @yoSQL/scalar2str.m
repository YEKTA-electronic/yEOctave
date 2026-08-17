% convert string/char of any data types for use in QUERY
function str = scalar2str(obj,x)
	if nargin==0 || isempty(x)
		str = 'NULL';

	elseif ischar(x)
		str = ['"',x,'"'];% put "" around a sq'' string

	elseif !isscalar(x)
		error('Scalar to String | Not SCALAR input')

	elseif isnumeric(x)
		% NUMBERs
		if isna(x) || isnan(x)
			str = 'NULL';
		elseif isinteger (x) || islogical(x)
			str = int2str(x);
		elseif isfloat(x)
			str = num2str(x);
		endif

	elseif isstruct(x)
		str = jsonencode(x);

	else
		error('unsupported type!')
	endif
endfunction
