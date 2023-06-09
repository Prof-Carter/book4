% exercise_02_03_sym.m
% 問題 2.3
% ラプラス変換
% 【Symbolic Math Toolbox】

clear
format compact

syms t real

disp(' ')
disp(' ***** 問題 2.3 (1) ********************')
ft = 2*exp(-2*t) + 3*exp(-t)
fs = laplace(ft)
fs = prod(factor(fs))

disp(' ')
disp(' ***** 問題 2.3 (2) ********************')
ft = 1 - exp(-2*t)*(cos(t) - 4*sin(t))
fs = laplace(ft)
fs = prod(factor(fs))

disp(' ')
disp(' ***** 問題 2.3 (3) ********************')
ft = 1 - exp(-2*t)*(t + 1)
fs = laplace(ft)
fs = prod(factor(fs))



