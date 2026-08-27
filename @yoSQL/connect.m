function obj = connect(obj, connectionMode,commitMode)
% list of available commands:
% readonly | connect | create | 0 | off | disconnect | close | auto | manual
% ARGs------------------------------------
	if nargin<2
		connectionMode = 'connect';% default
	end
	if nargin<3
		commitMode = 'auto';% default
	endif
% CONNECT -------------------------------------------------
	switch (connectionMode)

		case {'readonly','connect','create'}
			try

				if isempty(obj.link)
					disp('making a new connection...')
				elseif isopen(obj.link)
					error('Already opened !')
				elseif
					disp('re-open-ing the connection...')
				endif

				obj.link = sqlite (obj.path, connectionMode);%\yEGram\db
				obj.mode = connectionMode;% set if connected fine
				obj.tik = tic;
				disp(['DB Connected in [',connectionMode,'] mode'])

			catch
				obj.link = [];
				obj.mode = 0;
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
			endif

		otherwise % trace
			disp('DB CONNECT | wrong connection mode')
	endswitch
% COMMIT ------------------------------------------------------
	switch (commitMode)
		case {'auto',1}
			obj.link.AutoCommit = "on";% by default
		case {'manual',0}
			obj.link.AutoCommit = "off";
		otherwise% trace
			disp('DB CONNECT | wrong commit mode')
	endswitch

endfunction
