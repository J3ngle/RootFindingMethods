%% Bisection function 
function [xvec, xdif, fx, nit,error] = bisect(a, b, tol, maxiter, fun)
    error = tol + 1;
    nit = 0;
    xvec = [];
    fx = [];
    xdif = [];

    while nit < maxiter && error > tol
        nit = nit + 1;
        c = (a + b) / 2;
        x = c;
        fc = feval(fun, x); 
        xvec = [xvec; x];
        fx = [fx; fc];
        x = a;
        if fc * feval(fun, x) > tol
            a = c;
        else
            b = c;
        end
        error = 0.5 * abs(b - a);
        xdif = [xdif; error];
    end
end
