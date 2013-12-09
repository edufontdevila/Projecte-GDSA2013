PREREC = zeros(20,2);
for w = 1 :20

%
Class = knnclassify(id_classed, id_classed_train, class4train, w,'euclidean','neares');

%
%%GENERACIO VECTOR OUTPUT

OUT = [id4class Class];
clear Translated class tags L l i c TAG;

%
   
%R = csvimport( 'results.csv' );
%R = csvimport( 'xec_result.csv' );
result = zeros (7);                %Matriu de confusio
e = 0;
true = 0;

for j = 1 : length(OUT)    %length(R)
%    [N, C] =  spacecuter(R(j));    %Suprimeix els espais
    N = char(OUT (j,1));
    C = char(OUT (j,2));

    
    p = classidentify (C);         %classe predicció

    
    if isKey(data_map,N)
        gt = classidentify (data_map(N)); %classe ground truth
    else
        warning('Unknown photo:\n\n\t%s\n', N );
        e = e + 1;
    end
    result(gt,p) = result(gt,p)+1;
end


class_cm = zeros (7,2,2);
PR = zeros (7,4);
F = zeros(7,1);
for n = 1 : length (result)
   class_cm(n,:,:) = tptn (result, n);%Matriu de confusio per classes
   [PR(n,1), PR(n,2),PR(n,3),PR(n,4)] =  prenrec(tptn (result,n));
    F(n) = F1_score(PR(n,1),PR(n,2)); 
% precision 1, recall 2, true negative rate 3,
end

class= {'other', 'sports', 'concert', 'non_event', 'conference', 'exhibition', 'theater_dance'};


acc = accuracy(result)
PRF = double(zeros(7,3));
PRF(:,1:2) = PR(:,1:2);
PRF(:,3) = F;

avg_PRF = double(zeros(1,3));
for i = 1 : 3
   avg_PRF(i)= mean(PRF(:,i)); 
end
   PREREC(w,1) = avg_PRF(1);
    PREREC(w,2) = avg_PRF(2);
end
figrue 
plot(PREREC(:,2),PREREC(:,1),);