%% @authorsKeung Charteris & T.s.road CZQ  
% @file "GAMutation.m"
% @version1.0 ($Revision$)  
% @date6/9/2016 $LastChangedDate$  
% @addr.GUET, Gui Lin, 540001,  P.R.China  
% @contact :cztsiang@gmail.com  
% @dateCopyright(c)  2016-2020,  All rights reserved.  
% This is anopen access code distributed under the Creative Commons Attribution License,which permits  
%unrestricted use, distribution, and reproduction in any medium, provided theoriginal work is properly cited.  
  
function [NewPop]=Mutation(OldPop,pMutation,VarNum)  
%变异操作  

global m n NewPop  
r=rand(1,m);  
position=find(r<=pMutation);  
len=length(position);  
if len>=1  
        fori=1:len  
                k=unidrnd(n,1,VarNum); %设置变异点数，一般设置1点  
                forj=1:length(k)  
                        ifOldPop(position(i),k(j))==1  
                               OldPop(position(i),k(j))=0;  
                        else  
                               OldPop(position(i),k(j))=1;  
                        end  
                end  
        end  
end  
NewPop=OldPop;  
