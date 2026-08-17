classdef yoSQLupdate < yoSQL
  properties
    query;% fill for direct usage

		table={};% FROM
		setPair;
		from;
		where;% unConditioned

		order;% not sorted
    limit = int64(0);% ALL as default
    offset = int64(0);% from begining

  endproperties

  methods

    % constructor ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    function obj = yoSQLupdate(from)
			if nargin>0
				obj.table = strtrim(from);
			endif
    endfunction

  endmethods
endclassdef
