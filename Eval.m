%%
% Copyright (c) 2013 Víctor Castaño, Yann de Couëssin, Xavier Figueras,
% Eduard Fontdevila
%
% MIT License
%
% For more information read the 'LICENSE.txt' file
%------------------------------------------------------------------------

%% resultats i comparació
ext = dir('*.txt'); %extencio imatges

for i = 1:W    %loop lectura

filename = ext(i).name;
fid= fopen(filename);
M = textscan(fid, '%s%s');
fclose(fid);
l = length(M{1});
    N = M{1};
    C = M{2};
    
   OUT =[N C];
%%

result = zeros (7);                %Matriu de confusio
e = 0;
true = 0;

for j = 1 : length(OUT)    %length(R)

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


acc = accuracy(result);
PRF = double(zeros(7,3));
PRF(:,1:2) = PR(:,1:2);
PRF(:,3) = F;

avg_PRF = double(zeros(1,3));
for i = 1 : 2                   %Calcul avg prec recall
   avg_PRF(i)= mean(PRF(:,i)); 
end
avg_PRF(3) = F1_score(avg_PRF(1),avg_PRF(2));
%% Plot

f = figure('Position', [250 250 750 470]);

%PRF per classe
cnames = {'Precisson', 'Recall', 'F-score'}; 
rnames = class; 
t = uitable('Data',PRF ,'ColumnName',cnames,... 
'RowName',rnames,'Tag','Table 1',...
'Position',[10 10 380 150]);

%Mitjanes
cnames = {'Precission', 'Recall', 'F-score'}; 
rnames = 'AVG'; 
t = uitable('Data',avg_PRF ,'ColumnName',cnames,... 
'RowName',rnames,'Tag','Table 2',...
'Position',[400 10 270 50]);

%Acuracy
cnames = {'Precission', 'Recall', 'F-score'}; 
rnames = 'ACC'; 
t = uitable('Data',acc ,... 
'RowName',rnames,'Tag','Table 3',...
'Position',[400 60 140 50]);

%Matriu de confusio multiclass
cnames = class; 
rnames = class; 
t = uitable('Data',result,'ColumnName',cnames,... 
'RowName',rnames,'Tag','Table 4',...
'ColumnWidth', {37 37 37 37 37 37 37},...
'Position',[10 310 400 160]);
cnames = {'P +','P -'}; 
rnames = {'GT +','GT -'}; 

%Matrius de confusio uniclass
mc = zeros (2);
mc2 = zeros(2);
for n = 1: 4;
mc = zeros (2);
mc(1,1) = class_cm(n,1,1);
mc(1,2) = class_cm(n,1,2);
mc(2,1) = class_cm(n,2,1);
mc(2,2) = class_cm(n,2,2);
t = uitable('Data',mc ,'ColumnName',cnames,... 
'RowName',rnames,'Tag','Table 4',...
'ColumnWidth', {40 40},...
'Position',[(10+140*(n-1)) 240 140 60]);
text((10+200*(n-1)), 350 ,class(n));
if n<4
mc2(1,1) = class_cm(n+4,1,1);
mc2(1,2) = class_cm(n+4,1,2);
mc2(2,1) = class_cm(n+4,2,1);
mc2(2,2) = class_cm(n+4,2,2);
t = uitable('Data',mc2 ,'ColumnName',cnames,... 
'RowName',rnames,'Tag','Table 4',...
'ColumnWidth', {40 40},...
'Position',[(10+140*(n-1)) 170 140 60]);
text((10+200*(n-1)),280,class(n+4));
end

end 
 

end







