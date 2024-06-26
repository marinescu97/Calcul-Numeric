function derivate=ecdifbungee(t,x,k)
m=importdata('masa.txt');
g=10;
a1=1;
a2=1;
Gr=m*g;
R=a1*x(2)+a2*abs(x(2))*x(2);
if x(1)>0
Fe=k*x(1);
else Fe=0;
end
derivate=[x(2); (Gr-Fe-R)/m];
