ext = dir('*.jpg'); %extencio imatges
N = numel(ext);
id4train = cell(N:1);
for i = 1:numel(ext)    %loop lectura
  filename = ext(i).name;%lectura nom
  id4train(i) = cellstr(filename(1:length(filename)-4));
end
id4train = id4train';
L = length(id4train);
class4train = cell(L,1);
for l = 1:L
  if isKey (data_map,id4train(l)) 
      class4train(l)= cellstr(data_map(char(id4train(l))));
  end
end
%%
ext = dir('*.jpg'); %extencio imatges
N = numel(ext);
id4class = cell(N:1);
for i = 1:numel(ext)    %loop lectura
  filename = ext(i).name;%lectura nom
  id4class(i) = cellstr(filename(1:length(filename)-4));
end
id4class = id4class';