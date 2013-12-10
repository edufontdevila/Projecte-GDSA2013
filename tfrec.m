%%
% Copyright (c) 2013 Víctor Castaño, Yann de Couëssin, Xavier Figueras,
% Eduard Fontdevila
%
% MIT License
%
% For more information read the 'LICENSE.txt' file
%------------------------------------------------------------------------

%%
function TF = tfrec (Tu, T)
N = length(Tu);
TF=zeros(1,N);

for k=1:N
  idx=ismember(T,Tu(k));
  TF(1,k)=sum(idx,2);
end
TF = TF./N;
end