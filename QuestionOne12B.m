%% @authors Keung Charteris & T.s.road CZQ
% @file "QuestionOne12B.m"
% @version 1.0 ($Revision$)
% @date 18/8/2016 $LastChangedDate$
% @addr. GUET, Gui Lin, 540001,  P.R.China
% @contact : cztsiang@gmail.com
% @date Copyright(c)  2016-2020,  All rights reserved.
% This is an open access code distributed under the Creative Commons Attribution License, which permits
% unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited.

function QuestionOne12B

clc;  %清除所有
clear all;%清除变量
close all;%关闭图片
format long
data=load('satinfo.txt');

% 已知量参数
Gm=3.986005e14;
%方程初值
Xt0=data(10,:);% 9号卫星
Xt1=data(7,:);% 6号卫星

%状态方程组公式(7)
D2x=@(t,y)[ -Gm./(y(4).^2+y(5).^2+y(6).^2).^1.5.*y(4);
       -Gm./(y(4).^2+y(5).^2+y(6).^2).^1.5.*y(5); 
       -Gm./(y(4).^2+y(5).^2+y(6).^2).^1.5.*y(6);
        y(1);
        y(2);
        y(3)];

tspan=0:10:9000;
options=odeset('abstol',10^(-7));  %设置绝对误差为10^(-7)
[X,Y]=ode45(D2x,tspan,Xt0([4,5,6,1,2,3]),options);
disp '9号卫星的位置';
Y0=[Y(6,[4,5,6]);Y(11,[4,5,6]);Y(16,[4,5,6]);Y(21,[4,5,6]);Y(26,[4,5,6])]%50,100,150,200,250时刻
[X6,Y6]=ode45(D2x,tspan,Xt1([4,5,6,1,2,3]),options);% 6号卫星

% figure;
plot3(Y(end,4),Y(end,5),Y(end,6),'rp','MarkerSize', 15, 'MarkerFaceColor', 'r');
hold on;
plot3(Y6(end,4),Y6(end,5),Y6(end,6),'rp','MarkerSize', 15, 'MarkerFaceColor', 'y');
hold on;
RE=0.64e7; 
[a,b,c]=sphere(77); 
colormap([0 0 1]);
mesh(RE*a,RE*b,RE*c);%绘制地球
hold on;

% plot3(Y0(:,1),Y0(:,2),Y0(:,3),'rp','MarkerSize', 15, 'MarkerFaceColor', 'r');

plot3(Y(:,4),Y(:,5),Y(:,6));
hold on;
plot3(Y6(:,4),Y6(:,5),Y6(:,6),'r');
legend('6号卫星','9号卫星'); 
title('卫星轨道示意图');


