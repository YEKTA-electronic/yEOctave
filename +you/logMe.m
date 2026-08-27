function logMe(words)
% adds time before the input, then DISP

	if ischar(words)
		textMsg = strtrim(words);

	elseif iscell(words)
		for i=1:length(words)
			if isnumeric(words{i})
				words{i} = num2str(words{i});
			endif
		endfor
		textMsg = strjoin(words,' | ');
	end
% NEED ATTENTION
	timeStr = strtrim(ctime(time()));
	disp([timeStr,' @ ',textMsg])
endfunction

