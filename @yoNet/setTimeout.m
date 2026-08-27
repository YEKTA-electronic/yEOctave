function obj = setTimeout(obj,tCon,tMax)

	if isempty(obj.timeOut) || !isstruct(obj.timeOut)
		obj.timeOut = struct();
	end

	obj.timeOut.connection = tCon;% [0]uses OS built-in default

	if nargin>1
		obj.timeOut.max = tMax;
	else
		obj.timeOut.max = 0;% timeout disabled entirely
	end

	if obj.timeOut.connection == 0
		obj.timeOut.str ='';
		you.logMe( {obj.name,'No timeout'} );
	else
		obj.timeOut.str = sprintf("--connect-timeout %d --max-time %d",obj.timeOut.connection,obj.timeOut.max);
		you.logMe ({obj.name,obj.timeOut.str})
	end


endfunction
