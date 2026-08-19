function y = typeTranslator(obj,varTypeChars)

	y = cell();% clean sheet

	for i=1:length(varTypeChars)
		c = lower(varTypeChars{i});

		switch(c)
			case {'char','c','string','s','text','t'}
				x = 'string';
			case {'i','int','int64'}
				x = 'int64';
			case {'d','double','r','real'}
				x = 'double';
			case {'l','logic','logical','binary','bool'}
				x = 'logical';
			case {'n','numeric'}
				x = 'numeric';
			case {'dt','datetime'}
				x = 'datetime';
			case {'categorical','cat'}
				x = 'categorical'
			otherwise
				x = 'cell';
		endswitch
		y(i) = x;

	endfor
endfunction
