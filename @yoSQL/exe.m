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
		if isa(stmt,'yoSQLselect')
			result = fetch (obj.link, query);
		elseif any(isa( stmt, {'yoSQLinsert','yoSQLupdate','yoSQLdelete'} ))
			execute(obj.link, query)
			result = true;
		else
			error('DB EXE | wrong input arg')
		endif

	catch
		beep
		result = false;
		warning(lasterror)
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

