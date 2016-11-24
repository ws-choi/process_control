clear all
close all

%%%% 변수 및 상수 선언
syms t param;

v0 = [2,5];
obj = @(param) fopdt_object(param, ones, 5, 100);

[x, feval] = fminsearch(obj, v0)