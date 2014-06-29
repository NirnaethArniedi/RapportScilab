clf;

n=40;
N=2;
p=0.7;
nbSimulations = 30;
vlim=0.1352434625+p;
//vlim=0;
stacksize('max');
for j=1:nbSimulations
    A = [1];
    D = [];
    for i = 1:20
        B=rand(1,N^i);
        C=(B>=p)+[A,A]//-(B<=p);
        A=C;
        D(i)=((max(A)/i))-vlim;
    end
    for i=21:n
        B=rand(1,N^21);
        C=(B>=p)+[A,A]//-(B<=p);
        A=C
        T=gsort(A);
        A=T(1:N^(20));
        D(i)=A(1,1)/i-vlim;
    end
    plot2d(D);
end;



