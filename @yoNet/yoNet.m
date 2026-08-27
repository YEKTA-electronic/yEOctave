classdef yoNet

	properties
		name = 'newNet'
		proxy = struct();
		timeOut = struct();
		resolver = '';
	endproperties

	methods
		function obj = yoNet(myName)
			if nargin >0
				obj.name = myName;
			endif
			obj = obj.setProxy ();
			obj = obj.setTimeout (0,0);% default OS
			you.introduceObject (obj);

		endfunction
	endmethods
endclassdef

