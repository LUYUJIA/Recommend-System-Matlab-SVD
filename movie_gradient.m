0
Ytran=Y;
for i=1:1000
    for j=1:1623
        switch Ytran(i,j)
            case 6
                Ytran(i,j)=3;
            case 5
                Ytran(i,j)=2;
            case 4
                Ytran(i,j)=1;
            case 3
                Ytran(i,j)=-1;
            case 2
                Ytran(i,j)=-2;
            case 1
                Ytran(i,j)=-3;
        end
        
    end
end


Ytran_mask=Ytran;
for i=1:100
    for j=1:100
        Ytran_mask(i,j)=0;
    end
end

W=Ytran_mask;

for i=1:1000
    for j=1:1623
        if W(i,j)~=0
            W(i,j)=1;
        end
    end
end

%k=1,2,3,4,5
k=5;

[U1,S1,V] = svds(Ytran_mask,k);

U=(U1*S1)';
V=V';
X=p(U,V);
E=inf;
lamuta=0.02;
miu=0.001;




while 1
    
     En=1/2*norm(W.*(Ytran_mask-X),2)^2;
    
    if(En<E)
        E=En;
    else
        break;
    end
    
    g_U=zeros(k,1000);
    g_V=zeros(k,1623);
    %gradient
    for i=1:1000
        Sum=0;
        for j=1:1623
            Sum=Sum+W(i,j)*(Ytran_mask(i,j)-X(i,j))*V(:,j);
        end
        g_U(:,i)=Sum-lamuta*U(:,i);
    end
    
    for j=1:1623
        Sum=0;
        for i=1:1000
            Sum=Sum+W(i,j)*(Ytran_mask(i,j)-X(i,j))*U(:,i);
        end
        g_V(:,j)=Sum-lamuta*V(:,j);
    end
    %update U,V
    
    U=U+miu.*g_U;
    V=V+miu.*g_V;
    X=p(U,V);
    %objective function
 
   
end

X_error=0;
num=0;

for i=1:100
    for j=1:100
        if Ytran(i,j)~=0
            num=num+1;
            X_error=X_error+(X(i,j)-Ytran(i,j))^2;
        end
    end
end

X_error=sqrt(X_error/num);






