function [root, fxnewt, iter] = newtonMethod(initialGuess, tol, maxiter, fun, funDerivative)
    iter = 0;
    x = initialGuess;
    error = tol + 1;
    fxnewt=[];
    while error > tol && iter < maxiter
        iter = iter + 1;
        fxnewt = [feval(fun, x)];
        f_prime_x = feval(funDerivative, x);

        if abs(f_prime_x) < eps
            error('Derivative is too small. Try again');
        end

        x = x - fxnewt / f_prime_x;
        error = abs(fxnewt);

        fprintf('Iteration %d: x = %f, f(x) = %f\n', iter, x, fxnewt);
    end

    root = x;
end
