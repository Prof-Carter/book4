% example_05_07_sym.m
% 例 5.7
% フィードバック制御系の内部安定性の判別：フルビッツの安定判別法（簡略化した条件）
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 例 5.7 ********************')

syms s
syms kP kI real

P = 5/(s^2 + 2*s + 2);
C = (kP*s + kI)/s;

[Np Dp] = numden(P);
[Nc Dc] = numden(C);
Delta = Dp*Dc + Np*Nc;
Delta = collect(Delta,s)

Delta = subs(Delta,kP,0.5)

hurwitz_sym