% %preprocessing
% Ytran=Y;
% for i=1:1000
%    for j=1:1623
%        if(Ytran(i,j)==3||Ytran(i,j)==2||Ytran(i,j)==1)
%           Ytran(i,j)=-1;
%      
%        elseif(Ytran(i,j)==6||Ytran(i,j)==5||Ytran(i,j)==4)
%           Ytran(i,j)=1;
%        end
%        
%    end
% end
% 
% %mask
% Ytran_mask=Ytran;
% 
% for i=1:100
%    for j=1:100
%      Ytran_mask(i,j)=0;
%    end
% end
% 
% %omit
% % n=0;
% % for i=100:1000
% %     n=n+1;
% %     if norm(Ytran_mask(n,:),1)<0
% %         Ytran_mask(n,:)=[];
% %         n=n-1;
% %     end
% % end
% % n=0;
% % for j=100:1623
% %     n=n+1;
% %     if norm(Ytran_mask(:,n),1)<0
% %         Ytran_mask(:,n)=[];
% %         n=n-1;
% %     end
% % end
% 
% 
% [U1,S1,V1] = svds(Ytran_mask,1);
% [U2,S2,V2] = svds(Ytran_mask,2);
% [U3,S3,V3] = svds(Ytran_mask,3);
% [U4,S4,V4] = svds(Ytran_mask,4);
% [U5,S5,V5] = svds(Ytran_mask,5);
% [U6,S6,V6] = svds(Ytran_mask,6);
% [U7,S7,V7] = svds(Ytran_mask,7);
% [U8,S8,V8] = svds(Ytran_mask,8);
% [U9,S9,V9] = svds(Ytran_mask,9);
% [U10,S10,V10] = svds(Ytran_mask,10);
% 
% 
% X1=U1*S1*V1';
% X2=U2*S2*V2';
% X3=U3*S3*V3';
% X4=U4*S4*V4';
% X5=U5*S5*V5';
% X6=U6*S6*V6';
% X7=U7*S7*V7';
% X8=U8*S8*V8';
% X9=U9*S9*V9';
% X10=U10*S10*V10';
% 
% X1=judge(X1);
% X2=judge(X2);
% X3=judge(X3);
% X4=judge(X4);
% X5=judge(X5);
% X6=judge(X6);
% X7=judge(X7);
% X8=judge(X8);
% X9=judge(X9);
% X10=judge(X10);
% 
% random=ones(100,100);
% for i=1:100
%     for j=1:100
%         if rand<=0.5
%             random(i,j)=-1;
%         end
%     end
% end
% 
% 
% % RMSE
% 
% num=0; 
% X_error1=0;
% X_error2=0;
% X_error3=0;
% X_error4=0;
% X_error5=0;
% X_error6=0;
% X_error7=0;
% X_error8=0;
% X_error9=0;
% X_error10=0;
% random_error=0;
% 
% for i=1:100
%     for j=1:100
%         if Y(i,j)~=0
%             num=num+1;
%             random_error=random_error+(random(i,j)-Ytran(i,j))^2;
%             X_error1=X_error1+(X1(i,j)-Ytran(i,j))^2;
%             X_error2=X_error2+(X2(i,j)-Ytran(i,j))^2;
%             X_error3=X_error3+(X3(i,j)-Ytran(i,j))^2;
%             X_error4=X_error4+(X4(i,j)-Ytran(i,j))^2;
%             X_error5=X_error5+(X5(i,j)-Ytran(i,j))^2;
%             X_error6=X_error6+(X6(i,j)-Ytran(i,j))^2;
%             X_error7=X_error7+(X7(i,j)-Ytran(i,j))^2;
%             X_error8=X_error8+(X8(i,j)-Ytran(i,j))^2;
%             X_error9=X_error9+(X9(i,j)-Ytran(i,j))^2;
%             X_error10=X_error10+(X10(i,j)-Ytran(i,j))^2;
%         end
%     end
% end
% 
% X_error1=sqrt(X_error1/num);
% X_error2=sqrt(X_error2/num);
% X_error3=sqrt(X_error3/num);
% X_error4=sqrt(X_error4/num);
% X_error5=sqrt(X_error5/num);
% X_error6=sqrt(X_error6/num);
% X_error7=sqrt(X_error7/num);
% X_error8=sqrt(X_error8/num);
% X_error9=sqrt(X_error9/num);
% X_error10=sqrt(X_error10/num);
% random_error=sqrt(random_error/num);

plot([1:10],[X_error],'linewidth',3);

h1=xlabel('Factor Rank K');
h2=ylabel('RMSE');
set(h1,'FontSize',16);
set(h2,'FontSize',16);
hold on



