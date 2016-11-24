function [ ret] = sopdt_object( param, Uss, K , N)

d2 = param(1);
tau1 = param(2);
tau2 = param(3);

%%%% 실제 y

y= @(t) 5 + 5/24*(-t^4 - 4*t^3 - 12*t^2 - 24*t - 24)*exp(-t);

%%%% 모델링된 y
y_modeling = @(t) Uss*K*(1-(tau1*exp(-(t-d2)/tau1)...
    -tau2*exp(-(t-d2)/tau2))/(tau1-tau2));

%%%% Objective Funtion

error = @(t) ...
    (y(t) - y_modeling(t))^2;

ret = 0;

for n = 1:N
    ret = ret + error(n);
end


end
