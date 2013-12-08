function y=afegir(C)
C=char(C);
L=length(C);
y=char(zeros(1,37));
y(1,1:L)=C;
size(y);
end