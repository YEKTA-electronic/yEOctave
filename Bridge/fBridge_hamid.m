% interface to terminal command line
function fBridge()

  myJson = '';% empty myStr/myJson

  %% get and combine strings into one
  while true
    %% get the input myStr from terminal (as a apart of input JSON)
    myStr = fgets(stdin);

    if myStr == -1
      break;% exit when input ends
    else
      myJson = [myJson myStr];% append
    endif

  endwhile

  try
    % Parse the JSON input
    data = jsondecode(myJson);
    
    % Extract function name and arguments
    if isfield(data, 'funcName') && isfield(data, 'args')
      funcName = data.funcName;
      args = data.args;
      
      % Check if the function file exists
      funcFile = [funcName '.m'];
      if exist(funcFile, 'file') == 2
        % Call the function with the provided arguments
        if isempty(args)
          result = feval(funcName);
        else
          % Convert args to cell array if it's a regular array
          if ~iscell(args)
            args = num2cell(args);
          endif
          result = feval(funcName, args{:});
        endif
        
        % Return the result as JSON to stdout
        response = struct('success', true, 'result', result);
        fprintf('%s\n', jsonencode(response));
      else
        % Function file not found
        error_msg = sprintf('Function file %s not found', funcFile);
        response = struct('success', false, 'error', error_msg);
        fprintf('%s\n', jsonencode(response));
      endif
    else
      % Invalid input format
      error_msg = 'Invalid input format. Expected: {"funcName": "myFunc", "args": [...]}';
      response = struct('success', false, 'error', error_msg);
      fprintf('%s\n', jsonencode(response));
    endif
    
  catch err
    % Handle any errors during execution
    error_msg = sprintf('Erro: %s', err.message);
    response = struct('success', false, 'error', error_msg);
    fprintf('%s\n', jsonencode(response));
  end_try_catch
  
end