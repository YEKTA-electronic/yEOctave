classdef yoSQLupdate < yoSQL
  properties
    query=char();% fill for direct usage

		table=char();
		setPair;
		where;% unConditioned

  endproperties

  methods

    % constructor ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    function obj = yoSQLupdate(tableName)
			if nargin>0
				obj.table = strtrim(tableName);
			endif
    endfunction

  endmethods
endclassdef
