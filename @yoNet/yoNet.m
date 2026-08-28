classdef yoNet

	properties
		name = 'newNet'
		proxy = struct();
		timeOut = struct();
		ping = struct();
		resolver = '';
	endproperties

	methods
		function obj = yoNet(myName)
			if nargin >0
				obj.name = myName;
			endif
			obj = obj.setProxy ();
			obj = obj.setTimeout (0,0);% default OS

		endfunction
	endmethods
endclassdef

