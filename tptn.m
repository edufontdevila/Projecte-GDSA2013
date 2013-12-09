function UCCM = tptn (MCCM, class_num)
%   UCCM = unic class confusion matrix [2,2]
%   MCCM = multi class confusion matrix
%   class_num = pos integer

if (length (MCCM)< class_num)
    error ('Class out of range');
else
    tp = MCCM(class_num,class_num);
    fn = sum(MCCM(class_num,:))-tp;
    fp = sum(MCCM(:,class_num))-tp;
    tn = sum(sum(MCCM))-tp-fn-fp;    
end

UCCM (1,1) = tp;
UCCM (2,1) = fp;
UCCM (1,2) = fn;
UCCM (2,2) = tn;


end