clear all
close all

%%%% ���� �� ��� ����
syms t param;

v0 = [2,1,1];
obj = @(param) objective_at(param, ones, 5, 100);

v = fminsearch(obj, v0)