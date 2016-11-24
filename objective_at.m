function [ result ] = objective_at( param, Uss, K , N)

d2 = param(1);
tau1 = param(2);
tau2 = param(3);

%%%% 실제 y

y= @(t) 25*dirac(t) + 50*dirac(1, t) + 50*dirac(2, t) ...
    + 25*dirac(3, t) + 5*dirac(4, t) + 5;

%%%% 모델링된 y
y_modeling = @(t) Uss*K*(1-(tau1.*exp(-(t-d2)./tau1)...
    -tau2.*exp(-(t-d2)./tau2))./(tau1-tau2));

%%%% Objective Funtion

error = @(t) ...
    (y(t) - y_modeling(t))^2;

ret = error(1);

for n = 2:N
    ret = ret + error(n);
end

result = ret;

end
