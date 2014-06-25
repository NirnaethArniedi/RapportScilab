clf;

n=20;
N=2;
p=0.7;
nbSimulations = 30;
a=-5;
b=5;

ecartType = sqrt(p*(1-p));

for j = 1:nbSimulations
    A = [0];
    D = [];
    for i = 1:n
        B=rand(1,N^i);
        C=(B>=p)+[A,A];
        A=C;
        E=(A>=(p*i+ecartType*a*sqrt(i)));
        D(i)=sum(E.*(A<=(p*i+ecartType*b*sqrt(i))));
    end
    plot2d(D, style=rand()*10);
end
