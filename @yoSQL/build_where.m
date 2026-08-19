function retStr = build_where(obj)

	if isempty(obj.where)
    retStr = '';
  elseif ischar(obj.where)
    retStr = ['WHERE ', strtrim(obj.where)];
  else
    error('UPDATE | wrong WHERE clause');
  endif

endfunction

