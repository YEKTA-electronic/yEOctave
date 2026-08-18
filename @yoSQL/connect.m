function obj = connect(obj, mode)

	switch (mode)

		case {'readonly','connect','create'}
			try
				if isempty(obj.link)
					disp('making a new connection...')
				elseif isopen(obj.link)
					error('Already opened !')
				elseif
					disp('re-open-ing the connection...')
				endif
				obj.link = sqlite (obj.path, mode);
				obj.mode = mode;% set if connected fine
				obj.tik = tic;
				disp(['DB Connected in [',mode,'] mode'])
			catch
				warning(['connecting failed | ',lasterr])
			end_try_catch

		case {0,'off','disconnect','close'}
			if isempty(obj.link)
				disp('No connection to close')
			elseif isopen(obj.link)
				close(obj.link)
				obj.mode = 0;
				disp(['DB [',obj.path,'] DISCONNECTED after ',num2str(toc(obj.tik),"%.1f"),' Sec'])
			else
				disp('Already closed')
			end

		case {'auto'}
			obj.link.AutoCommit = "on";% by default

		case {'manual'}
			obj.link.AutoCommit = "off";

		otherwise % trace
			disp('DB CONNECT | wrong input')
	endswitch

endfunction
