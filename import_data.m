%%%%%%%%%%LECTURA DADES
%LECTURA TAGS

close all
clear all
fid= fopen('sed2013_task2_dataset_train_tags.csv');
C = textscan(fid, '%s%s');
fclose(fid);

L=length(C{1});
k=1;

id=C{1}(2:L);
l=length(unique(id));
clear id;
tag=cell(l,1);
Id = tag;
ref = char(C{1}(2));
stri= '';
for i=1:L-1
    len = length(char(C{1}(i+1)));
    if len == length (ref)
        if sum (char(C{1}(i+1))== ref) == len 
            stri=[stri ' ' char(C{2}(i+1))];
        else
            tag(k) = cellstr(stri);
            Id(k) = C{1}(i) ;
            stri = '';
            stri=[stri ' ' char(C{2}(i+1))];
            k = k+1;
        end
    else
        tag(k) = cellstr(stri);
        Id(k) = C{1}(i) ;
        stri = '';
        stri=[stri ' ' char(C{2}(i+1))];
        k = k+1;
            
    end
    ref = char(C{1}(i+1));
    
end
    tag(k) = cellstr(stri);
    Id(k) = C{1}(i) ;


map_tag = containers.Map(Id,tag);
clear Id tag C stri len ref i l fid k;
%% LECTURA CLASSES

fid= fopen('sed2013_task2_dataset_train_gs.csv');
M = textscan(fid, '%s%s');
fclose(fid);
L = length(M{1});
id = M {1}(2:L);
class = M {2}(2:L);


data_map = containers.Map(id,class);

clear data id L M class;