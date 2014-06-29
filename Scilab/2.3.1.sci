clf;

n=20;
N=2;
p=0.7;
epsilon=0.001;
nbSimulations = 30;

for j = 1:nbSimulations
    A = [1];
    D = [];
    for i = 1:n
        B=rand(1,N^i);
        C=(B>=p)+[A,A];
        A=C;
        D(i)=sum((A>=((p+epsilon)*i)))/N^i
    end
    plot2d(D,style=rand()*10)
end
