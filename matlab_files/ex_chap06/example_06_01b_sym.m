% example_06_01b_sym.m
% 例 6.1
% マス・ばね・ダンパ系の P 制御（wn = wm となるような kP の設計と外乱応答の定常特性）
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 例 6.1（外乱応答） ********************')

syms s
syms a1 a0 b0 real
syms kP real
syms zeta wn K2 positive
syms wm positive

disp(' ')
disp(' ---- マス・ばね・ダンパ系の伝達関数 P(s) ---- ')
Ps = b0/(s^2 + a1*s + a0)
disp(' ')
disp(' ---- P コントローラ C(s) ---- ')
Cs = kP

disp(' ')
disp(' ---- Gyd(s) ---- ')
Gyd = collect(Ps/(1 + Ps*Cs),s)

[numGyd denGyd] = numden(Gyd)
coefficient = coeffs(denGyd,s)

disp(' ')
disp(' ---- 2 次遅れ系の伝達関数 Gyd2(s) ---- ')
Gyd2 = K2*wn^2/(s^2 + 2*zeta*wn*s + wn^2)

[numGyd2 denGyd2] = numden(Gyd2)
coefficient2 = coeffs(denGyd2,s)

disp(' ')
disp(' ---- K1, zeta, wn (Gyd(s) = Gyd2(s) となるように決定) ---- ')
K2 = simplify(subs(Gyd,s,0))

eqns = coefficient(1:2) - coefficient2(1:2);
sol = solve(eqns, {wn,zeta}, 'ReturnConditions', true);

zeta = simplify(sol.zeta)
wn   = simplify(sol.wn)

disp(' ')
disp(' ---- wn = wm となるような kP ---- ')
sol_kP = solve(wn-wm, kP)

disp(' ')
disp(' ---- 外乱応答の定常値 ys ---- ')
ys = subs(Gyd,s,0)



