function result = exe(obj, stmt)

	% may the query is written by hand
	if isempty(stmt.query)
		% compose into strings
		query = stmt.build();
	else
		query = stmt.query;
	endif

	% do the SQL...
	try
		t = tic;
		% needs pkg sqlite
		if nargout>0
			result = fetch (obj.link, query);
		else
			execute(obj.link, query)
		endif

	catch
		disp(lasterror)
	end_try_catch

	% report
	delay = toc(t);
	disp(['Queried [',obj.path,'] ',int2str(delay*1000),' mSec'])
	if length(query)>99
		disp([strtrunc(query,99), '...'])
	else
		disp(query)
	end

endfunction

