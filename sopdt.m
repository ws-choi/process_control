clear all
close all

%%%% ���� �� ��� ����
syms t param;

v0 = [2,5,5];
obj = @(param) sopdt_object(param, ones, 5, 30);

[x, feval] = fminsearch(obj, v0)