% exercise_02_03_sym.m
% –â‘è 2.3
% ƒ‰ƒvƒ‰ƒX•ÏŠ·
% ySymbolic Math Toolboxz

clear
format compact

syms t real

disp(' ')
disp(' ***** –â‘è 2.3 (1) ********************')
ft = 2*exp(-2*t) + 3*exp(-t)
fs = laplace(ft)
fs = prod(factor(fs))

disp(' ')
disp(' ***** –â‘è 2.3 (2) ********************')
ft = 1 - exp(-2*t)*(cos(t) - 4*sin(t))
fs = laplace(ft)
fs = prod(factor(fs))

disp(' ')
disp(' ***** –â‘è 2.3 (3) ********************')
ft = 1 - exp(-2*t)*(t + 1)
fs = laplace(ft)
fs = prod(factor(fs))



