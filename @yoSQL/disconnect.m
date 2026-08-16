function disconnect(obj)
    if isopen(obj.link)
			close(obj.link)
			disp(['DB [',obj.path,'] DISCONNECTED after ',num2str(toc(obj.tik),"%.1f"),' Sec'])
		else
			disp('No connection to close')
		end
end
