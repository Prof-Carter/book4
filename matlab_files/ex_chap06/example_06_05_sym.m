% example_06_05_sym.m
% 例 6.5
% 無限級数
% 【Symbolic Math Toolbox】


disp(' ')
disp(' ***** 例 6.5 ********************')

syms s

disp(' ')
disp(' ---- P(s) ---- ')
Ps = (s + 9)/(3*s^2 + 6*s + 9)

disp(' ')
disp(' ---- 1/P(s) ---- ')
inv_Ps = 1/Ps

disp(' ')
disp(' ---- 1/P(s) をマクローリン展開（2 次まで） ---- ')
inv_Ps_taylor = taylor(inv_Ps,s,'Order',3)


