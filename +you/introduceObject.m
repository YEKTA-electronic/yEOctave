function introduceObject(objX)

	disp(['A new object of type [',class(objX),'] just created with:'])
	methods(objX);
	properties(objX);

endfunction

