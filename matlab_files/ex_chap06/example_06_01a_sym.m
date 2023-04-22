% example_06_01a_sym.m
% 例 6.1
% マス・ばね・ダンパ系の P 制御（wn = wm となるような kP の設計と目標値応答の定常特性）
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 例 6.1（目標値応答） ********************')

syms s
syms a1 a0 b0 real
syms kP real
syms zeta wn K1 positive
syms wm positive

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
K1 =  simplify(subs(Gyr,s,0))

eqns = coefficient(1:2) - coefficient2(1:2);
sol = solve(eqns, {wn,zeta}, 'ReturnConditions', true);

zeta = simplify(sol.zeta)
wn   = simplify(sol.wn)

disp(' ')
disp(' ---- wn = wm となるような kP ---- ')
sol_kP = solve(wn-wm, kP)

disp(' ')
disp(' ---- 定常位置偏差 ep ---- ')
yp = subs(Gyr,s,0);
ep = simplify(1 - yp)



