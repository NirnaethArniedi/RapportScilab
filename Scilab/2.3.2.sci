clf;

function Y=simu(j,n,p,epsilon) 
    Xi = [0];
    D = [];
    M=[]
    Zn = 1;
    for i = 1:n
        N=grand(1,Zn,'geom',0.5); 
        //Simulation du nombre d'enfant par individu                        
        G=[];
        c=0;
        for k = 1:Zn
           if(N(1,k)>0) then    
              for l=1:N(1,k)      //Creation des position
                  c=c+1;          //de depart de la 
                  G(1,c)=Xi(1,k); //de la generation i+1
              end;		
           end;
        end
        Zn=sum(N);                 
        B=grand(1,Zn,'bin',1,0.6);//Variables
        Pos=B+G;                  // de position de la
        Xi=Pos;			// generation i+1
    end
    E=(Xi>=((p-epsilon)*n));
    H=(Xi<=((p+epsilon)*n));
    nb=E*(H');
    Y=nb/(2^(n));
endfunction

nbSimu=1000;
n=14;
p=0.7;
nbCourbes=10;

for k=1:nbCourbes
    epsilon=0.5
    ListeRes=parallel_run(1:nbSimu,n,p,epsilon,"simu");
    //Realisation de L=nbSimu experiences.
    SommeRes=cumsum(ListeRes);
    Moyenne=[];
    for i=1:nbSimu                    //Calcul des estimateurs
        Moyenne(1,i)=SommeRes(1,i)/i;//successifs
    end;                              // de E(Y).
    plot2d(Moyenne,style=rand()*10);
end;
