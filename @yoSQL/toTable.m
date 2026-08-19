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

		for jRow=1:1:tHeight
			try
				value = colData{jRow};
				value = you.typeConverter(value,colTypes{iCol});
				if !isempty(value)
					t(jRow,iCol) = value;
				end

			catch
				problems++;
				disp(sprintf("toTABLE converter | PROBLEM #%d on (%d, %2d):",problems,jRow,iCol))
				disp(lasterr)
				disp(['original value of type [',class(value),'] was:'])
				disp(value)
				disp('inserted as :')
				disp(t{jRow,iCol})

			end_try_catch
		endfor% jRow

	endfor% i
	% send back the TABLE
	retVal = t;
	% report
	disp(['toTABLE | conversion finished with (',int2str(problems),') problems'])
endfunction
