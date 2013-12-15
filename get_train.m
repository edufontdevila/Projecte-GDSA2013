%% 4TRAIN
%cd('/Users/Edu/Desktop/mediaeval6/2')
%Escriure directori de les imatges a importar pel TRAIN
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
date4train = zeros(L,1);
for l = 1:L
  if isKey (data_map,id4train(l)) 
      class4train(l)= cellstr(data_map(char(id4train(l))));
      date4train(l) = datenum(ext(l).date);
  end
end
clear N;
%%  4CLASS
%cd('/Users/Edu/Desktop/mediaeval6/1')
%Escriure directori de les imatges a importar pel TEST
ext = dir('*.jpg'); %extencio imatges
N = numel(ext);
id4class = cell(N:1);
date4class = zeros(N,1);
for i = 1:numel(ext)    %loop lectura
  filename = ext(i).name;%lectura nom
  id4class(i) = cellstr(filename(1:length(filename)-4));
  date4class(i) = datenum(ext(i).date);
end
id4class = id4class';



class4class = cell(N,1);
for l = 1:N
  if isKey (data_map,id4class(l)) 
      class4class(l)= cellstr(data_map(char(id4class(l))));
  end
end
NC4T = unique(class4class);
