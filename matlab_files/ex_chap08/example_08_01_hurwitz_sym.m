% example_08_01_hurwitz_sym.m
% 例 8.1
% フルビッツの安定判別法（簡略化した条件）
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 例 6.3 ********************')

syms s
syms kP real

disp(' ')
disp(' ---- P(s) ---- ')
Ps = 1/(s + 1)^3

disp(' ')
disp(' ---- C(s) ---- ')
Cs = kP

disp(' ')
disp(' ---- L(s) = P(s)C(s) ---- ')
Ls = Ps*Cs

disp(' ')
disp(' ---- 特性多項式 ⊿(s) ---- ')
[numLs  denLs]  = numden(Ls);

Delta = denLs + numLs;
Delta = collect(Delta,s)


disp(' ')
disp('**********************************************')
disp('***** kP > 0 であるときの                 *****')
disp('***** フルビッツの安定判別法による安定条件 ******')
disp('**********************************************')
disp(' ')
assume(kP > 0)

hurwitz_sym





