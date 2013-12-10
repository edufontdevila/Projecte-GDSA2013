%%
% Copyright (c) 2013 Víctor Castaño, Yann de Couëssin, Xavier Figueras,
% Eduard Fontdevila
%
% MIT License
%
% For more information read the 'LICENSE.txt' file
%------------------------------------------------------------------------

%%
function acc = accuracy (MCCM)
true = 0;
    for n = 1 : length (MCCM)
        true = true + MCCM(n,n);
    end
    
all = sum(sum(MCCM));    
acc = true/all*100;

end