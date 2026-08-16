function monitor(obj)
% only watch the system for verbose & diagnose
	disp('We are here:')
	disp(pwd)

	disp(['I am here the [',mfilename,'] m-file inside:'])
	disp([fileparts(__FILE__),' (directory)'])
	disp([__FILE__,' (absolute path)'])
	disp(['I am called from >> ',command_line_path,' <<'])

	disp(['Root directory is: ',obj.dirRoot])
	disp(['My directory is: ',obj.dirMain])
	disp(['Exclusion pattern is: ', strjoin(obj.dirExc,'|') ])

endfunction
