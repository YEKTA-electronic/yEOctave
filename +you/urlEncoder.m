function z = urlEncoder(text)

	z = text;
	% MUST be FIRST encoding step !!!
	z = strrep(z, '%', '%25');
	% special chars
	z = strrep(z, sprintf('\n'),'%0A');
	% others
	z = strrep(z, "'", '%27');
  z = strrep(z, ' ', '%20');
	z = strrep(z, '!', '%21');
	z = strrep(z, '"', '%22');
	z = strrep(z, '#', '%23');
	z = strrep(z, '$', '%24');
	z = strrep(z, '&', '%26');
	z = strrep(z, '(', '%28');
	z = strrep(z, ')', '%29');
	z = strrep(z, '*', '%2A');
	z = strrep(z, '+', '%2B');
	z = strrep(z, ',', '%2C');
	z = strrep(z, '/', '%2F');
	z = strrep(z, ':', '%3A');
	z = strrep(z, ';', '%3B');
	z = strrep(z, '<', '%3C');
	z = strrep(z, '=', '%3D');
	z = strrep(z, '>', '%3E');
	z = strrep(z, '?', '%3F');
	z = strrep(z, '@', '%40');
	z = strrep(z, '[', '%5B');
	z = strrep(z, '\', '%5C');
	z = strrep(z, ']', '%5D');
	z = strrep(z, '^', '%5E');
	z = strrep(z, '`', '%60');
	z = strrep(z, '{', '%7B');
	z = strrep(z, '|', '%7C');
	z = strrep(z, '}', '%7D');
	z = strrep(z, '~', '%7E');

endfunction
