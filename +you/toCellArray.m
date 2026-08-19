function z = toCellArray(c)
  if iscell(c)
    z = c;% no need to refine
    return
  else
    z = cell();% new clean sheet
  end

  for i=1:numel(c)
    z{i} = c(i);
  endfor
endfunction
