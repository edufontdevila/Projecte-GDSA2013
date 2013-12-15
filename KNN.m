%%klassify
train = [id_classed_train date4train];
class = [id_classed date4class];
Class = knnclassify(class,train , class4train, 3, 'euclidean', 'nearest');
Class2 = knnclassify(date4class,date4train , class4train, 5, 'euclidean', 'nearest');

%%
%%GENERACIO VECTOR OUTPUT

OUT = [id4class Class2];

%%
%%ESCRIPTURA FITXER RESULTATS
fid = fopen('date.txt', 'w');
for i = 1:size(OUT,1)
    fprintf(fid,repmat('%s \b',1,size(OUT,2)-1), OUT{i,1:end-1});
    fprintf(fid,'%s\n',OUT{i,end});
end
fclose(fid);