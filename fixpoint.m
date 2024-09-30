function [xvectfp, xdiffp, fxfp, nitfp] = fixpoint(initialGuess, tol, maxiter, fun, phi)
    fperror = tol + 1;
    nitfp = 0;
    xvectfp = initialGuess;
    x = initialGuess;
    fxfp = feval(fun, x);
    xdiffp = [];

    while nitfp < maxiter && fperror > tol
        nitfp = nitfp + 1;
        x = xvectfp(nitfp);
        xnfp = feval(phi, x);
        fperror = abs(xnfp - x);
        xdiffp = [xdiffp; fperror];
        x = xnfp; 
        xvectfp = [xvectfp; x]; 
        fxfp = [fxfp; feval(fun, x)];
    end
end

