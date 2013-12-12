function TF = tfrec (Tu, T)
N = length(Tu);
TF=zeros(1,N);

for k=1:N
  idx=ismember(T,Tu(k));
  TF(1,k)=sum(idx,2);
end
TF = TF./N;
end