function [ result ] = objective_at(d2, tau1, tau2)
Uss = ones;

K=5; %%% TODO: ¹Ù²ã¾ßÇÔ

%%%% ½ÇÁ¦ y

y= @(t) 25*dirac(t) + 50*dirac(1, t) + 50*dirac(2, t) ...
    + 25*dirac(3, t) + 5*dirac(4, t) + 5;

%%%% ¸ðµ¨¸µµÈ y
y_modeling = @(t) Uss*K*(1-(tau1.*exp(-(t-d2)./tau1)...
    -tau2.*exp(-(t-d2)./tau2))./(tau1-tau2));

%%%% Objective Funtion

error = @(t) ...
    (y(t) - y_modeling(t))^2;

ret = error(1);

for n = 2:N
    ret = ret + error(n, d2, tau1, tau2);
end

result = ret;

end
