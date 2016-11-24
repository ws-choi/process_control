function [ result ] = objective( N,error, d2, tau1, tau2)

    ret = error(1, d2, tau1, tau2);

    for n = 2:N
        ret = ret + error(n, d2, tau1, tau2);
    end

    result = ret;

end


