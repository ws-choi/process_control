clear all
close all

banana = @(y)100*(y(2)-y(1)^2)^2+(1-y(1))^2;
[x,fval] = fminsearch(banana,[-1.2, 1])

%%%% 변수 및 상수 선언
syms t d2 tau1 tau2;

v0 = [2,1,1]
obj = @(d2, tau1, tau2) objective_at(d2, tau1, tau2);

v = fminsearch('objective_at', [2,1,1]); 
clear;