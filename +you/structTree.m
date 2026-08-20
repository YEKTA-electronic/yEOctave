function z = structTree(x,isSub)
	% format
	wMax = 997;% max length of each line
	sRoot = '|';
	sLeaf = '---';
	sIndent = '   ';

	% correction
	if nargin ==1
		isSub = 0;
	endif

	if isstruct(x)
		fieldNames = fieldnames(x);
	else
		warning(['structTree() wrong input type: ',typeinfo(x)])
		disp(x)
		return
	end


	if isSub==0
		% root
		n = numel(x);
		b = sizeof(x);
		z = sprintf("Structure Tree (1/%d)[%d Bytes]",n,b);
	else
		% sub
		z = '';% clean sheet
	endif

	for i=1:numel(fieldNames);
		fieldName = fieldNames{i};
		fieldValue = x.(fieldName);

		if isstruct(fieldValue)
			% recursive call for sub-struct (struct-in-strcut)
			% make the sub-strcut "name"
			subName = sprintf("%s%s%s[%s](1/%d)",repmat(sIndent,1,isSub),sRoot,sLeaf,fieldName,numel(fieldValue));
			% sub-strcut:
			subLines = you.structTree(fieldValue,isSub+1);
			newLine = sprintf("%s%s\n",subName,subLines);

		else
			newLine = [' ',fieldName,' = '];

			if ischar(fieldValue)
				newLine = [newLine,'"',fieldValue,'"'];
			elseif numel(fieldValue)>1
				[s1 s2] = size(fieldValue);
				newLine = [newLine,'Array ',num2str(s1),'X',num2str(s2)];
			elseif isnumeric(fieldValue) || islogical(fieldValue)
				newLine = [newLine,'#',num2str(fieldValue)];
			else
				newLine = [newLine,typeinfo(fieldValue)];
			endif
			%newLine = [newLine,']'];

			newLine = sprintf("%s%s%s%s",repmat(sIndent,1,isSub),sRoot,sLeaf,newLine);
			newLine = strtrunc(newLine,(wMax-isSub*4));
		endif

		z = sprintf("%s\n%s",z,newLine);

	endfor

endfunction
