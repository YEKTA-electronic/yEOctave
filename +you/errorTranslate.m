function str = errorTranslate(n)
	% returns the meaning of each error code
	% common curl exit codes
  switch (n)
    case 0      str = 'OK';
    case 1      str = 'Unsupported protocol';
    case 2      str = 'Failed to initialize';
    case 3      str = 'URL malformed';
    case 5      str = 'Proxy resolution failed';
    case 6      str = 'Host resolution failed';
    case 7      str = 'Failed to connect to host';
    case 8      str = 'Weird server reply';
    case 22     str = 'HTTP error >= 400';
    case 28     str = 'Operation timeout';
    case 35     str = 'SSL/TLS handshake failed';
    case 52     str = 'Empty reply from server';
    case 56     str = 'Recv failure';
    case 60     str = 'SSL cert verify failed';
    otherwise   str = sprintf('Unknown error code [%d]', n);
  endswitch
endfunction
