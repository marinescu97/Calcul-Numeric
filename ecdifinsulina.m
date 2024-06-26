function derivate = ecdifinsulina(t,x)
kin=2;
k12=1;
k21=1.5;
k13=2;
k31=1.75;
derivate(1)=kin*x(4)+k31*x(3)+k21*x(2)-k13*x(1)-k12*x(1);
derivate(2)=k12*x(1)-k21*x(2);
derivate(3)=k13*x(1)-k31*x(3);
derivate(4)=-kin*x(4);
derivate=[derivate(1);derivate(2);derivate(3);derivate(4)]


