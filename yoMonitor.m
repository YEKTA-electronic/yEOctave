function yoMonitor()
% only watch the system for verbose & diagnose
	disp('Hello World!')
	disp('We are here:')
	disp(pwd)
	disp('I am the:')
	disp([__FILE__,' (absolute path)'])
	disp([fileparts(__FILE__),' (directory)'])
	disp([mfilename,' (m-file)'])
	disp('I am called from:')
	disp(command_line_path)
	disp('Good Luck!')
endfunction
