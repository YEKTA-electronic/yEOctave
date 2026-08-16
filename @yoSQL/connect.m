function obj = connect(obj)
	obj.link = sqlite (obj.path, obj.mode);
	obj.tik = tic;
	disp(['DB Connected in [',obj.mode,'] mode'])
endfunction
