% remove some paths (fit the pattern) from all the availables
% returns the remained path list
function pathList = filter (obj)

	% delete the excludeds
	if numel(obj.dirExc) < 1
		warning('nothing to EXCLUDE/FILTER out')
		return
	endif

	pathList = obj.dirFind;% full copy

	for i=1:numel(obj.dirExc)
		% repeatative calls on pathList
		[pathList,~] = spliter (pathList, obj.dirExc{i});
	endfor




	% report
	if numel(pathList)<1
		warning('No PATH remained to ADD')
	else
		for i=1:numel(pathList)
			disp([int2str(i),'# ',pathList{i}])
		endfor
	endif
	disp([int2str(numel(pathList)),' Path(s) to be added'])

endfunction
%% localfunctions :::::::::::::::::::::::::::::::::::::::::::::::::
function [remained, removed] = spliter (pList,name)

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

