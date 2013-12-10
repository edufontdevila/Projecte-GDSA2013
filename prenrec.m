%%
% Copyright (c) 2013 Víctor Castaño, Yann de Couëssin, Xavier Figueras,
% Eduard Fontdevila
%
% MIT License
%
% For more information read the 'LICENSE.txt' file
%------------------------------------------------------------------------

%%
function [P, R, TN, ACC] = prenrec (conf_matrix)
    tp = conf_matrix(1,1);
    fp = conf_matrix(2,1);
    fn = conf_matrix(1,2);
    tn = conf_matrix(2,2);
    P = tp/(tp+fp);
    R = tp/(tp+fn);
    TN = tn/(tp+fp);
    ACC = (tp+tn)/(tp+tn+fp+fn);
   
end