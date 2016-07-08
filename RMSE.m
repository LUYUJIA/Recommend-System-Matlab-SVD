function e=RMSE(E)
num=sum(sum(E~=0));
e=sqrt(norm(E,1)/num);