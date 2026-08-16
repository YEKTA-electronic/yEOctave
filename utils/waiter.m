function waiter(timeMin,timeMax)

  persistent counter = 0;% how many calls
  persistent t1st;% 1st call
  persistent tLast;
  persistent tMin=0;% default = no restriction
  persistent tMax=0;% default = no restriction

  if nargin == 2
    %% INIT mode
    t1st = tic;% fill with real value
    counter = 0;
    tMax = timeMax;
		tMin = timeMin;
		disp(['loop configed with [',num2str(tMin),' | ',num2str(tMax),'] Sec'])
		disp(['loop started : ',ctime(time())])

	elseif nargin == 1
		%% reConfig
		tMin = timeMin;
		disp(['loop RECONFIGed into [',num2str(tMin),'] Sec'])

  else
    %% WATCH mode
    counter++;

		% report
    disp(sprintf("End of loop #%u | %.1f Sec",counter,toc(tLast)))

    %% STOPer
    if (kbhit(1))
      disp("STOP: press [R]eload , [E]xit or [any key] to continue ?");
      % flush keyboard stack
      while kbhit(1)
      endwhile

			userKbh = kbhit();% wait for user input
      if userKbh == 'e' || userKbh == 'E'
        error('Exit Loop...')
			elseif userKbh == 'r' || userKbh == 'R'
				disp('Reload project...')
				rehash()% Reinitialize Octave’s load path directory cache
      endif
    else
      disp('press any key to stop/exit')
    endif

    %% regular timer checks
    if tMax>0 && toc(t1st)>tMax

      error(['time over : ',num2str(toc(t1st))])
    endif

		%% WAITer
    tWait = tMin-toc(tLast);
    if tWait>0
      %disp(sprintf("pause for [%3.1f Sec] to the next loop",tWait))
      pause(tWait);
    endif

	endif

  % unconditional tasks
  tLast = tic;
endfunction
