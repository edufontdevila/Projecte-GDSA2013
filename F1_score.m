%%
% Copyright (c) 2013 Víctor Castaño, Yann de Couëssin, Xavier Figueras,
% Eduard Fontdevila
%
% MIT License
%
% For more information read the 'LICENSE.txt' file
%------------------------------------------------------------------------

%%
function F = F1_score(P, R)
    F = 2*(P*R/(P+R));
end