%%
% Copyright (c) 2013 Víctor Castaño, Yann de Couëssin, Xavier Figueras,
% Eduard Fontdevila
%
% MIT License
%
% For more information read the 'LICENSE.txt' file
%------------------------------------------------------------------------

%%
function [v] = tagstovector (tags)
    n = find(tags < char (33)) ;
    L= length(n);
    v = cell(L,1);
    if L >0
        for i = 1 : L-1
            v(i,1) = cellstr(tags(n(i)+1:n(i+1)-1));
        end
        v (L,1) = cellstr(tags(n(L)+1:length(tags)));
    else
        v = tags;
    end
    v = v';
end