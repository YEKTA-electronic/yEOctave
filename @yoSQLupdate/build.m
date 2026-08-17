% convert fields into string
function retString = build (obj)
	% UPDATE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	updateStr = ['UPDATE ',obj.table];
	setStr 		= obj.build_set;
	whereStr 	= obj.build_where;
	orderStr 	= obj.build_order;
	% concatenator :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	retString = strjoin( {updateStr,setStr,whereStr,orderStr} ,' ');
endfunction
