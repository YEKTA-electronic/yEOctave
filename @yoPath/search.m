function obj = search(obj)
	ps = genpath(obj.dirRoot);% [string]
	pathList = strsplit(ps,";");% convert to cell array
	% delete the excludeds
	if numel(obj.dirExc) > 0
		for i=1:numel(obj.dirExc)
			% repeatative calls on pList
			[pathList,~] = filterOut (pathList, obj.dirExc{i});
		endfor
	endif

	% report
	if numel(pathList)>0
		for i=1:numel(pathList)
			disp([int2str(i),'# ',pathList{i}])
		endfor
	endif
	disp([int2str(numel(pathList)),' Path(s) to be added'])

	% save in object
	obj.dirInc = pathList;
endfunction
%% localfunctions :::::::::::::::::::::::::::::::::::::::::::::::::
function [remained, removed] = filterOut (pList,name)

	pFind = cell();
	% search...
	findEnd = endsWith (lower(pList), lower([ filesep(),name]));
	findMid = index (lower(pList), lower([ filesep(),name,filesep()]));% sub-folders
	findAll = findEnd | findMid;% OR
	% results:
	remained = pList(!findAll);% what have been left/kept
	% remove unwanteds
	pFind = pList(findAll);% what are to be picked out

	% report
	if numel(pFind)>0
		for i=1:numel(pFind)
			disp([int2str(i),'# ',pFind{i}])
		endfor
		disp(['All "',upper(name),'" folders and thier subfolders are skipped'])
	endif
endfunction


