%% VECTORS CLASS TAG 
% ENTRENAMENT
T1= '';
T2=T1;
T3=T1;
T4=T1;
T5=T1;
T6=T1;
T7=T1;
x = 0;
L = length(id4train);

for i = 1 : L   %Lectrura tags per entrenament
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
Tu1 = unique(T1);
Tu2 = unique(T2);
Tu3 = unique(T3);
Tu4 = unique(T4);
Tu5 = unique(T5);
Tu6 = unique(T6);
Tu7 = unique(T7);
clear E;
%% MAPA TAGS-CLASSE d(ò.Ó)b

%KeySet = unique([T1, T2, T3, T4, T5, T6, T7]);
f1 = tfrec(Tu1,T1);
f2 = tfrec(Tu2,T2);
f3 = tfrec(Tu3,T3);
f4 = tfrec(Tu4,T4);
f5 = tfrec(Tu5,T5);
f6 = tfrec(Tu6,T6);
f7 = tfrec(Tu7,T7);


%ValueSet = [c1 c2 c3 c4 c5 c6 c7];

%% CREACIO MAP PER CLASSE
map_TC1 = containers.Map(Tu1, f1);
map_TC2 = containers.Map(Tu2, f2);
map_TC3 = containers.Map(Tu3, f3);
map_TC4 = containers.Map(Tu4, f4);
map_TC5 = containers.Map(Tu5, f5);
map_TC6 = containers.Map(Tu6, f6);
map_TC7 = containers.Map(Tu7, f7);

clear KeySet ValueSet c1 c2 c3 c4 c5 c6 c7;
clear  T1 T2 T3 T4 T5 T6 T7 x C T Tu1 Tu2 Tu3 Tu4 Tu5 Tu6 Tu7;
%% VECTOR DE CLASSES I ASSIGNACIÓ DADES CLASS
L = length(id4class);
id_classed = zeros(L,7);


if L>0
for i = 1:L;    %sumatori puntuacions per classe
    if isKey( map_tag,id4class(i))
    tag = map_tag (char(id4class(i)));
    if isempty(tag) == 0
        tags = tagstovector(tag);
        for l = 1:length(tags)
            TAG = char(tags(l));
            if isKey ( map_TC1, TAG)
                c = 1;
                id_classed(i,c) = id_classed(i,c) + map_TC1 (TAG);
            end
            if isKey ( map_TC2, TAG)
                c = 2;
                id_classed(i,c) = id_classed(i,c) + map_TC2 (TAG);
            end
            if isKey ( map_TC3, TAG)
                c = 3;
                id_classed(i,c) = id_classed(i,c) + map_TC3 (TAG);
            end
            if isKey ( map_TC4, TAG)
                c = 4;
                id_classed(i,c) = id_classed(i,c) + map_TC4 (TAG);
            end
            if isKey ( map_TC5, TAG)
                c = 5;
                id_classed(i,c) = id_classed(i,c) + map_TC5 (TAG);
            end
            if isKey ( map_TC6, TAG)
                c = 6;
                id_classed(i,c) = id_classed(i,c) + map_TC6 (TAG);
            end
            if isKey ( map_TC7, TAG)
                c = 7;
                id_classed(i,c) = id_classed(i,c) + map_TC7 (TAG);
            end
        end
    end
    end


end
end

%% VECTOR DE CLASSES I ASSIGNACIÓ DADES TRAIN

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
                c = 1;
                id_classed_train(i,c) = id_classed_train(i,c) + map_TC1 (TAG);
            end
            if isKey ( map_TC2, TAG)
                c = 2;
                id_classed_train(i,c) = id_classed_train(i,c) + map_TC2 (TAG);
            end
            if isKey ( map_TC3, TAG)
                c = 3;
                id_classed_train(i,c) = id_classed_train(i,c) + map_TC3 (TAG);
            end
            if isKey ( map_TC4, TAG)
                c = 4;
                id_classed_train(i,c) = id_classed_train(i,c) + map_TC4 (TAG);
            end
            if isKey ( map_TC5, TAG)
                c = 5;
                id_classed_train(i,c) = id_classed_train(i,c) + map_TC5 (TAG);
            end
            if isKey ( map_TC6, TAG)
                c = 6;
                id_classed_train(i,c) = id_classed_train(i,c) + map_TC6 (TAG);
            end
            if isKey ( map_TC7, TAG)
                c = 7;
                id_classed_train(i,c) = id_classed_train(i,c) + map_TC7 (TAG);
            end
        end
    end
    end
end
end
%% KNN CLASSIFICACIO
Class2 = Class;
Class = knnclassify(id_classed, id_classed_train, class4train, 3);


%%
%%GENERACIO VECTOR OUTPUT

OUT = [id4class Class];

%%
%%ESCRIPTURA FITXER RESULTATS
fid = fopen('resultats.txt', 'w');
for i = 1:size(OUT,1)
    fprintf(fid,repmat('%s \b',1,size(OUT,2)-1), OUT{i,1:end-1});
    fprintf(fid,'%s\n',OUT{i,end});
end
fclose(fid);