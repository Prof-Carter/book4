% exercise_06_01_sym.m
% 問題 6.1
% マス・ばね・ダンパ系の P コントローラの設計（zeta = zeta_m となるような kP の設計）
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 問題 6.1（目標値応答） ********************')

syms s
syms a1 a0 b0 real
syms kP real
syms zeta wn K1 positive
syms zeta_m positive

disp(' ')
disp(' ---- マス・ばね・ダンパ系の伝達関数 P(s) ---- ')
Ps = b0/(s^2 + a1*s + a0)
disp(' ')
disp(' ---- P コントローラ C(s) ---- ')
Cs = kP

disp(' ')
disp(' ---- Gyr(s) ---- ')
Gyr = collect(Ps*Cs/(1 + Ps*Cs),s)

[numGyr denGyr] = numden(Gyr)
coefficient = coeffs(denGyr,s)

disp(' ')
disp(' ---- 2 次遅れ系の伝達関数 Gyr2(s) ---- ')
Gyr2 = K1*wn^2/(s^2 + 2*zeta*wn*s + wn^2)

[numGyr2 denGyr2] = numden(Gyr2)
coefficient2 = coeffs(denGyr2,s)

disp(' ')
disp(' ---- K1, zeta, wn (Gyr(s) = Gyr2(s) となるように決定) ---- ')
K1 = subs(Gyr,s,0)

eqns = coefficient(1:2) - coefficient2(1:2);
sol = solve(eqns, {zeta,wn}, 'ReturnConditions', true);

zeta = sol.zeta
wn   = sol.wn

disp(' ')
disp(' ---- zeta = zeta_m となるような kP ---- ')
sol_kP = solve(zeta-zeta_m, kP)




