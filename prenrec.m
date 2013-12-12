function [P, R, TN, ACC] = prenrec (conf_matrix)
    tp = conf_matrix(1,1);
    fp = conf_matrix(2,1);
    fn = conf_matrix(1,2);
    tn = conf_matrix(2,2);
    
    if tp+fp == 0
        P = 0;
        TN = 0;
    else
        P = tp/(tp+fp);
        TN = tn/(tp+fp);
    end
    
    if tp+fn == 0
        R = 0;
    else
        R = tp/(tp+fn);
    end
    
    ACC = (tp+tn)/(tp+tn+fp+fn);
   
end