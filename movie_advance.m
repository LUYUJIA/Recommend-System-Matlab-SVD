
Ytran=Y;

Ytran_mask=Ytran;
for i=1:100
    for j=1:100
        Ytran_mask(i,j)=0;
    end
end

W=Ytran_mask./6;
one=ones(1000,1623);
X=zeros(1000,1623);
k=10;

J=inf;



%EM algorithm minimize J
E=inf;
while 1
    
    [U1,S1,V1] = svds(W.*Ytran_mask+(one-W).*X,k);
    X=U1*S1*V1';
     En=norm(W.*(Ytran_mask-X),2)^2;
    
    if(En<E)
        E=En;
    else
        break;
    end
end



num=0;
X_error=0;
for i=1:100
    for j=1:100
        if Y(i,j)~=0
            num=num+1;
            X_error=X_error+(X(i,j)-Y(i,j))^2;
        end
    end
end

X_error=sqrt(X_error/num);



