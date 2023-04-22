% exercise_05_04_sym.m
% 問題 5.4 (1)
% フィードバック制御系の内部安定性の判別：フルビッツの安定判別法（簡略化した条件）
% 【Symbolic Math tauoolbox】

disp(' ')
disp(' ***** 問題 5.4 (1) ********************')

clear
format compact

syms s
syms kP real

P = 2/(s^3 + 4*s^2 + 5*s - 1);
C = kP;

[Np Dp] = numden(P);
[Nc Dc] = numden(C);
Delta = Dp*Dc + Np*Nc;
Delta = collect(Delta,s)

hurwitz_sym

