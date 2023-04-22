% example_06_02a_sym.m
% 例 6.2
% マス・ばね・ダンパ系の P-D 制御（目標値応答）
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 例 6.2（目標値応答） ********************')

syms s
syms a1 a0 b0 real
syms kP kD real
syms zeta wn K1 positive
syms zeta_m wm positive

disp(' ')
disp(' ---- マス・ばね・ダンパ系の伝達関数 P(s) ---- ')
Ps = b0/(s^2 + a1*s + a0)
disp(' ')
disp(' ---- P--D コントローラ C(s) ---- ')
C1s = kD*s + kP
C2s = kP

disp(' ')
disp(' ---- Gyr(s) ---- ')
Gyr = collect(Ps*C2s/(1 + Ps*C1s),s)

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
disp(' ---- wn = wm, zeta = zeta_m となるような kP, kD ---- ')
sol2 = solve({wn-wm,zeta-zeta_m}, {kP,kD});

kP = sol2.kP
kD = sol2.kD

disp(' ')
disp(' ---- 定常位置偏差 ep ---- ')
yp = subs(Gyr,s,0);
ep = simplify(1 - yp)



