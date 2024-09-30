function [root, fxnewt, iter] = Newt2(initialGuess, tol, maxiter, fun, funDerivative)


    iter = 0;
    x = initialGuess;
    error = tol + 1;
    fxnewt = [];
    
    while error > tol && iter < maxiter
        iter = iter + 1;
        fx = feval(fun, x);
        fxnewt = [fxnewt, fx];
        f_prime_x = feval(funDerivative, x);

        if abs(f_prime_x) < eps
            error('Derivative is too small. Try again');
        end

        x = x - fx / f_prime_x;
        error = abs(fx);

        fprintf('Iteration %d: x = %f, f(x) = %f\n', iter, x, fx);
    end

    root = x;
end
