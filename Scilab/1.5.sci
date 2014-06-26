clf;
p=0.7;
N=100;
x=0.7;
nbSimulations=10;

M=4000;

for i=1:nbSimulations
    A=[];
    for n=1:1:N
        S=rand(M,n);
        S=(S>=(1-p));
        S=sum(S,'c');
        S=(S>=(n*x));
        S=sum(S)/M;
        a=(-1/n)*log(S);
        A(n)=a;
    end
    plot2d(A, style=rand()*7);
end
