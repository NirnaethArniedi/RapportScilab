clf;

n=20;
N=2;
p=0.7;
epsilon=0.6;
nbSimulations = 10;

for j = 1:nbSimulations
    A = [0];
    D = [];
    for i = 1:n
        B=rand(1,N^i);
        C=(B>=p)+[A,A];
        A=C;
        E=(A>=((p-epsilon)*i));
        D(i)=sum(E.*(A<=((p+epsilon)*i)))/N^i;
    end
    plot2d(D, style=rand()*10);
    disp(D);
end
