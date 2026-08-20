function url = buildUrl(obj, url, params)
    % BUILDURL - Construct full URL with optional query parameters
    %   url = obj.buildUrl(url)
    %   url = obj.buildUrl(url, params)
    %   params: struct of key/value pairs

    if nargin > 2 && ~isempty(params) && ~isempty(fieldnames(params))

        fields = fieldnames(params);
        query = cell(1, length(fields));

        for i = 1:length(fields)
            v = params.(fields{i});
            if isnumeric(v)
                v = num2str(v);
            end
            query{i} = sprintf('%s=%s', fields{i}, v);
        end

        url = [url, '?', strjoin(query, '&')];
    end
end
