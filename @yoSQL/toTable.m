% convert object of "dbtable" of pkg "sqliet" into table of pkg "datatypes"
function retVal = toTable(obj,forcedTypes)
	% arg correction
	if nargin<2
		% defined by object property
		colTypes = obj.colTypes;
	else
		% forced by input arg.
		colTypes = forcedTypes;
	endif
	% fetch from "dbtable" object
	colNames = string(obj.result.Properties.VariableNames);
	colTypes = postpad(colTypes, length(colNames), '?');% fix the length
	colTypes = you.typeTranslate(colTypes);

	data = obj.result{:};

	% provide the tables properties
	tWidth = length(colNames);
	tHeight = rows(data{:,1});
	tSize = [tHeight , tWidth];
	% CREATE an empty table
	t = table('Size',tSize,'VariableTypes',colTypes,'VariableNames',colNames);

	problems = 0;% counting conversion missings
	for iCol=1:1:tWidth
		% fetch all the column as a vector Cell
		colData = data{:,iCol};

		for j=1:1:tHeight
			try
				value = colData{j};
				value = obj.typeConverter(value,colTypes{iCol});
				t(j,iCol) = value;
			catch
				problems++;
				disp('the original value:')
				disp(colData{j})
				disp('is inserted as : ')
				disp(t(j,iCol))
				warning(['toTABLE converter | PROBLEM #',int2str(problems),' @ (',int2str(j),',',int2str(iCol),')'])
			end_try_catch
		endfor% j

	endfor% i
	% send back the TABLE
	retVal = t;
	% report
	disp(['toTABLE | conversion finished with (',int2str(problems),') problems'])
endfunction
