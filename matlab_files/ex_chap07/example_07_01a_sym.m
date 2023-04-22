% example_07_01a_sym.m
% —á 7.1
% ü”g”‰“š
% ySymbolic Math Toolboxz

clear
format compact

syms s
syms t real
syms A real
syms w positive

disp(' ')
disp(' ***** —á 7.1 ***************************')

disp(' ')
disp(' ---- u(t) ---- ')
ut = A*sin(w*t)

disp(' ')
disp(' ---- u(s) ---- ')
us = laplace(ut)

disp(' ')
disp(' ---- P(s) ---- ')
P = 1/(s + 1)

disp(' ')
disp(' ---- y(s) ---- ')
ys = P*us

disp(' ')
disp(' ---- y(t) ---- ')
yt = ilaplace(ys)

