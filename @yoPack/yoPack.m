function myPkg(pkgList)

	if nargin<1
		pkgList = {'sqlite','statistics','datatypes'};
	endif

	for i=1:numel(pkgList)
		pkgName = pkgList{i};
		try
			pkg('load',pkgName)
			ver(pkgName)
		catch
			warning(['PKG | loading failed: ',pkgName])
			pkg('search',pkgName)
		end_try_catch
	endfor

endfunction
