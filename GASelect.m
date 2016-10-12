%% @authorsKeung Charteris & T.s.road CZQ  
% @file "GASelect.m"
% @version1.0 ($Revision$)  
% @date6/9/2016 $LastChangedDate$  
% @addr.GUET, Gui Lin, 540001,  P.R.China  
% @contact :cztsiang@gmail.com  
% @dateCopyright(c)  2016-2020,  All rights reserved.  
% This is anopen access code distributed under the Creative Commons Attribution License,which permits  
%unrestricted use, distribution, and reproduction in any medium, provided theoriginal work is properly cited.  
   
%选择操作  
%采用基于轮盘赌法的非线性排名选择  
%各个体成员按适应值从大到小分配选择概率：  
%P(i)=(q/1-(1-q)^n)*(1-q)^i,  其中 P(0)>P(1)>...>P(n), sum(P(i))=1  
   
function [selectpop]=GASelect(FUN,pop,bounds,bits)    
global m n  
selectpop=zeros(m,n);  
fit=zeros(m,1);  
for i=1:m  
       fit(i)=feval(FUN(1,:),(b2f(pop(i,:),bounds,bits)));%以函数值为适应值做排名依据  
end  

selectprob=fit/sum(fit);%计算各个体相对适应度(0,1)  
q=max(selectprob);%选择最优的概率  
x=zeros(m,2);  
x(:,1)=[m:-1:1]';  
[yx(:,2)]=sort(selectprob);  
r=q/(1-(1-q)^m);%标准分布基值  
newfit(x(:,2))=r*(1-q).^(x(:,1)-1);%生成选择概率  
newfit=cumsum(newfit);%计算各选择概率之和  
rNums=sort(rand(m,1));  
fitIn=1;
newIn=1;  

while newIn<=m  
        ifrNums(newIn)<newfit(fitIn)  
               selectpop(newIn,:)=pop(fitIn,:);  
                newIn=newIn+1;  
        else  
                fitIn=fitIn+1;  
        end  
end  
