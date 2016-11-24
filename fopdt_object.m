function [ ret] = fopdt_object( param, Uss, K , N)

d = param(1);
tau = param(2);

%%%% 실제 y

y= @(t) 5 + 5/24*(-t^4 - 4*t^3 - 12*t^2 - 24*t - 24)*exp(-t);

%%%% 모델링된 y
y_modeling = @(t) Uss*K*(1-exp((d-t)/tau));

%%%% Objective Funtion

error = @(t) ...
    (y(t) - y_modeling(t))^2;

ret = 0;

for n = 1:N
    ret = ret + error(n);
end


end
