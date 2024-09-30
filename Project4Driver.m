%% Project 4
% Jonathan Engle
%Due:
%Perform bisection, Newtons method and fixed point method
clear;clc;clear all 
tic
%% Test 1
%initialize variables for f(x)
global a
a=2; %-3
global b
b=10; %3
global tol
tol=10^(-6);
global maxiter
maxiter=10000;
%Guess of 1 spits out error
%A good guess is 1 and 4 for f(x)
global initialGuess
initialGuess=9;
x=linspace(a,b);

fun=@(t)(t*exp(-t)-0.06064);
funDerivative=@(t)((1-t)*exp(-t));
fphi=@(t)(t*exp(-t)+t-0.06064);
fphinewt=@(t)(t-(t*exp(-t)-0.06064)/((1-t)*exp(-t)));

gfun=@(x)(x^3-x-6);
gfunDerivative=@(x)(3*x^2-1);
gphi=@(x)((x+6)^(1/3));

%Bisection method
[xvec, xdif, fx, nit] = bisect(a, b, tol, maxiter, fun);
% %Output 
% disp("Root approx Bisection");
% xvec(nit);
% disp("Itterations For Bisection");
% nit;
%plot(log(xdif))
%Newtons method
% [root, fxnewt, iter] = newtonMethod(initialGuess, tol, maxiter, fun, funDerivative);
% disp("Root approx Newtons");
% root
% disp("Iterations For Newton");
% iter
[root, fxnewt, iter] = Newt2(initialGuess, tol, maxiter, fun, funDerivative);
% disp("Root approx Newtons");
% root;
% disp("Iterations For Newton");
% iter;
% plot((fxnewt));

%Fixed point method
[xvectfp,xdiffp, fxfp,nitfp]=fixpoint(initialGuess, tol, maxiter, fun ,fphinewt);
%root approximation for fixed point
disp("Root approx Fixed point");
%xvectfp(nitfp);
%disp("Iterations For Fixed point");
nitfp

%looks good!
%plot(log(fxfp))
%plot((xdif));

%% Correctness test
hold on
plot(fxnewt,'-m')
plot(fx,'-b')

hold off


%% Plotting
%fplot(@(x)(x^3-x-6),'-mo');

%fplot(@(x)(x*exp(-x)-0.06064), [a,b], '-mo');
%grid on 
toc