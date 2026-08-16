% convert object of "dbtable" (of "sqliet" package) into struct Array
function retVal = toStruct (obj,forcedTypes)
	% arg correction
	if nargin<2
		% defined by object property
		colTypes = obj.structFieldTypes;
	else
		% forced by input arg.
		colTypes = forcedTypes;
	endif
	% fetch from "dbtable" object
	data = obj.result{:};
	colNames = obj.result.Properties.VariableNames;
	% options
	colTypes = postpad(colTypes, length(colNames), '?');% fix the length
	colTypes = typeTranslator(colTypes);
	% sweep all the values 1by1
	tWidth = length(colNames);
	tHeight = rows(data(:,1));
	% convert mix cell (num/string) into struct array:::::::::::::::::::::::::::::
	s = struct();% clean sheet

	problems = 0;% counting conversion missings
	for iCol=1:tWidth
		colData = data(:,iCol);% fetch all the column as a vector Cell
		for j=1:tHeight
			try
				value = colData{j};
				value = typeConverter(value,colTypes{iCol});
				s(j).(colNames{iCol}) = value;% insert into strcut array
			catch
				problems++;
				disp('the original value:')
				disp(colData{j})
				disp('is inserted as : ')
				disp(t(j,iCol))
				warning(['PROBLEM #',int2str(problems),' | convert to table @ (',int2str(j),',',int2str(iCol),')'])
			end_try_catch

		endfor% j
	endfor% i
	% struct output is ready
	retVal = s;
endfunction
