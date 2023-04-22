% example_06_02b_sym.m
% 例 6.1
% マス・ばね・ダンパ系の P-D 制御（外乱応答）
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 例 6.2（外乱応答） ********************')

syms s
syms a1 a0 b0 real
syms kP kD real
syms zeta wn K2 positive
syms zeta_m wm positive

disp(' ')
disp(' ---- マス・ばね・ダンパ系の伝達関数 P(s) ---- ')
Ps = b0/(s^2 + a1*s + a0)
disp(' ')
disp(' ---- P--D コントローラ C(s) ---- ')
C1s = kD*s + kP
C2s = kP

disp(' ')
disp(' ---- Gyd(s) ---- ')
Gyd = collect(Ps/(1 + Ps*C1s),s)

[numGyd denGyd] = numden(Gyd)
coefficient = coeffs(denGyd,s)

disp(' ')
disp(' ---- 2 次遅れ系の伝達関数 Gyd2(s) ---- ')
Gyd2 = K2*wn^2/(s^2 + 2*zeta*wn*s + wn^2)

[numGyd2 denGyd2] = numden(Gyd2)
coefficient2 = coeffs(denGyd2,s)

disp(' ')
disp(' ---- K2, zeta, wn (Gyd(s) = Gyd2(s) となるように決定) ---- ')
K2 =  simplify(subs(Gyd,s,0))

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
disp(' ---- 外乱応答の定常値 ys ---- ')
ys = subs(Gyd,s,0)



