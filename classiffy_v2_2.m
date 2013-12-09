
%% VECTORS CLASS TAG
T1= '';
T2=T1;
T3=T1;
T4=T1;
T5=T1;
T6=T1;
T7=T1;
x = 0;
L = length(id4train);

for i = 1 : L
    if isKey(map_tag,char(id4train(i))) && isKey(data_map, char(id4train(i)))     
        tags = map_tag(char(id4train(i)));
        C = classidentify(data_map(char(id4train(i))));
        T = tagstovector(tags);
        switch C
            case 1 
                T1 = [T1  T];

            case 2 
                T2 = [T2 T];

            case 3 
                T3 = [T3 T];

            case 4 
                T4 = [T4 T];

            case 5 
                T5 = [T5 T];

            case 6 
                T6 = [T6 T];

            case 7 
                T7 = [T7 T];
        end
    else
     warning('Unknown photo' );
     x = x+1
    end


            
end
%%
T1 = unique(T1);
T2 = unique(T2);
T3 = unique(T3);
T4 = unique(T4);
T5 = unique(T5);
T6 = unique(T6);
T7 = unique(T7);
clear E;
%% MAPA TAGS-CLASSE

%KeySet = unique([T1, T2, T3, T4, T5, T6, T7]);
c1 = ones(1, length(T1));
c2 = ones(1,length(T2))*2;
c3 = ones(1,length(T3))*3;
c4 = ones(1,length(T4))*4;
c5 = ones(1,length(T5))*5;
c6 = ones(1,length(T6))*6;
c7 = ones(1,length(T7))*7;


ValueSet = [c1 c2 c3 c4 c5 c6 c7];

%% CREACIO MAP
map_TC1 = containers.Map(T1, c1);
map_TC2 = containers.Map(T2, c2);
map_TC3 = containers.Map(T3, c3);
map_TC4 = containers.Map(T4, c4);
map_TC5 = containers.Map(T5, c5);
map_TC6 = containers.Map(T6, c6);
map_TC7 = containers.Map(T7, c7);

clear KeySet ValueSet c1 c2 c3 c4 c5 c6 c7 T1 T2 T3 T4 T5 T6 T7 x;

%% VECTOR DE CLASSES I ASSIGNACIÓ

L = length(id4class);
id_classed = zeros(L,7);

Class = zeros (L,1);
if L>0
for i = 1:L;
    if isKey( map_tag,id4class(i))
    tag = map_tag (char(id4class(i)));
    if isempty(tag) == 0
        tags = tagstovector(tag);
        for l = 1:length(tags)
            TAG = char(tags(l));
            if isKey ( map_TC1, TAG)
                c = map_TC1 (TAG);
                id_classed(i,c) = id_classed(i,c) + 1;
            end
            if isKey ( map_TC2, TAG)
                c = map_TC2 (TAG);
                id_classed(i,c) = id_classed(i,c) + 1;
            end
            if isKey ( map_TC3, TAG)
                c = map_TC3 (TAG);
                id_classed(i,c) = id_classed(i,c) + 1;
            end
            if isKey ( map_TC4, TAG)
                c = map_TC4 (TAG);
                id_classed(i,c) = id_classed(i,c) + 1;
            end
            if isKey ( map_TC5, TAG)
                c = map_TC5 (TAG);
                id_classed(i,c) = id_classed(i,c) + 1;
            end
            if isKey ( map_TC6, TAG)
                c = map_TC6 (TAG);
                id_classed(i,c) = id_classed(i,c) + 1;
            end
            if isKey ( map_TC7, TAG)
                c = map_TC7 (TAG);
                id_classed(i,c) = id_classed(i,c) + 1;
            end
        end
    end
    end
    M = max(id_classed(i,:));
    if M == 0
        Class(i) = -1;
    else
        class = find(id_classed(i,:),M);
    if length (class)>1
        Class (i) = class(1);
    else
        Class (i) = class;
    end
    end

end
end

%% per aval

L = length(id4train);
id_classed_train = zeros(L,7);

Class = zeros (L,1);
if L>0
for i = 1:L;
    if isKey( map_tag,id4train(i))
    tag = map_tag (char(id4train(i)));
    if isempty(tag) == 0
        tags = tagstovector(tag);
        for l = 1:length(tags)
            TAG = char(tags(l));
            if isKey ( map_TC1, TAG)
                c = map_TC1 (TAG);
                id_classed_train(i,c) = id_classed_train(i,c) + 1;
            end
            if isKey ( map_TC2, TAG)
                c = map_TC2 (TAG);
                id_classed_train(i,c) = id_classed_train(i,c) + 1;
            end
            if isKey ( map_TC3, TAG)
                c = map_TC3 (TAG);
                id_classed_train(i,c) = id_classed_train(i,c) + 1;
            end
            if isKey ( map_TC4, TAG)
                c = map_TC4 (TAG);
                id_classed_train(i,c) = id_classed_train(i,c) + 1;
            end
            if isKey ( map_TC5, TAG)
                c = map_TC5 (TAG);
                id_classed_train(i,c) = id_classed_train(i,c) + 1;
            end
            if isKey ( map_TC6, TAG)
                c = map_TC6 (TAG);
                id_classed_train(i,c) = id_classed_train(i,c) + 1;
            end
            if isKey ( map_TC7, TAG)
                c = map_TC7 (TAG);
                id_classed_train(i,c) = id_classed_train(i,c) + 1;
            end
        end
    end
    end
end
end
%% KNN
Class = knnclassify(id_classed, id_classed_train, class4train, 15);

%%
%%GENERACIO VECTOR OUTPUT

OUT = [id4class Class];
clear Translated class tags L l i c TAG;
%%
%%ESCRIPTURA FITXER RESULTATS
fid = fopen('resultats.txt', 'w');
for i = 1:size(OUT,1)
    fprintf(fid,repmat('%s \b',1,size(OUT,2)-1), OUT{i,1:end-1});
    fprintf(fid,'%s\n',OUT{i,end});
end
fclose(fid);