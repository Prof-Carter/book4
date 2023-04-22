% example_02_06_sym.m
% ó· 2.6
% ÉâÉvÉâÉXïœä∑
% ÅySymbolic Math ToolboxÅz

clear
format compact

syms t real

% -------------------------------------------------------
disp(' ')
disp(' ***** ó· 2.6 (1) ********************')
ft = 1 + 2*exp(-t) - 3*exp(-2*t)
fs = laplace(ft)
fs = prod(factor(fs))

% -------------------------------------------------------
disp(' ')
disp(' ***** ó· 2.6 (2) ********************')
ft = 1 - exp(-t)*(cos(2*t) - (1/2)*sin(2*t))
fs = laplace(ft)
fs = prod(factor(fs))

% -------------------------------------------------------
disp(' ')
disp(' ***** ó· 2.6 (3) ********************')
ft = 1 + exp(-t)*(t - 1)
fs = laplace(ft)
fs = prod(factor(fs))



