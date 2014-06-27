clf;
p=0.1;
N=1000;
x=0.15;
nbSimulations=7;

M=1000000;
pas=30;

for i=1:nbSimulations
    p = p+0.1;
    x = x+0.1;
    A=[];
    B=[];
    B(5) = x*log((x*(1-p))/(p*(1-x))) - log((1-p)/(1-x));
    for n=5*pas:pas:N
        S=grand(1, M, 'bin', n, p);
        S=sum(S>=n*x)/M;
        a=(-1/n)*log(S);
        A(n/pas)=a;
        B(n/pas)=B(5);
    end
    couleur=i+1;
    plot2d(A, style=couleur);
    plot2d(B, style=couleur);
end
