function obj = pingTest (obj)
% checks if the net object could reach internet
	obj.ping.time = time();
% test and record
	obj.ping.delay = double(?)
	obj.ping.TF = logical(?);
% report
	if obj.ping.TF
		you.logMe ({obj.name,'ping DELAY',obj.ping.delay})
	else
		you.logMe ({obj.name,'ping','FAIL'})
	endif

endfunction

