classdef yoSQLselect < yoSQL
  properties
    query;% fill for direct usage
		result;% direct result of running this query in "sqlite" package

		from = '';
		colNames = '';% dafault = all cols
		colTypes = {};% not forced by default
    distinct = logical(0);% not unique
    where = '';% unConditioned

		order = '';% not sorted
    nullsFirst = logical(0);% FIRST as default
    limit = int64(0);% ALL as default
    offset = int64(0);% from begining

  endproperties

  methods
    % constructor ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    function obj = yoSQLselect(query)
			if nargin>0
				obj.query = strtrim(query);
			endif
    endfunction

  endmethods
endclassdef
