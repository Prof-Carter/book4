% exercise_07_10_sym.m
% 問題 7.10
% RLC 回路の周波数特性（共振の解析）
% 【Symbolic Math Toolbox】

disp(' ')
disp(' ***** 問題 7.10 (1) ********************')

clear
format compact

syms s
syms R L C positive
syms K zeta wn positive

disp(' ')
disp(' ---- RLC 回路の伝達関数 P(s) ---- ')
Ps = 1/(L*C*s^2 + R*C*s + 1)

disp(' ')
disp(' ---- 1/P(s) ---- ')
inv_Ps = expand(1/Ps)

disp(' ')
disp(' ---- 1/P(s) の係数 ---- ')
coefficient = coeffs(inv_Ps,s)

disp(' ')
disp(' ---- 2 次遅れ系の伝達関数 P2(s) ---- ')
Ps2 = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)

disp(' ')
disp(' ---- 1/P2(s) ---- ')
inv_Ps2 = expand(1/Ps2)

disp(' ')
disp(' ---- 1/P2(s) の係数 ---- ')
coefficient2 = coeffs(inv_Ps2,s)

disp(' ')
disp(' ---- K, zeta, wn (1/P(s) = 1/P2(s) となるように決定) ---- ')
eqns = coefficient - coefficient2;
sol = solve(eqns, {K,zeta,wn}, 'ReturnConditions', true);

K    = sol.K
zeta = sol.zeta
wn   = sol.wn

disp(' ')
disp(' ---- オーバーシュートを生じないような R の範囲 ---- ')
[sol params conds] = solve(zeta >= 1/sqrt(2), R, 'ReturnConditions', true);
conds = subs(conds,R)

disp(' ')
disp(' ---- オーバーシュートを生じないような R の範囲（L = 200 [mH], C = 10 [μF]） ---- ')
simplify(subs(conds,{L,C},{200e-3,10e-6}),'Steps',50)


disp(' ')
disp(' ***** 問題 7.10 (2) ********************')
disp(' ')
disp(' ---- ピーク角周波数 wp ---- ')
wp = wn*(1 - 2*zeta^2)^(1/2)
wp = simplify(subs(wp,{L,C,R},{200e-3,10e-6,100}))
wp = double(wp)

disp(' ')
disp(' ---- 共振ピーク Mp ---- ')
Mp = 1/(2*zeta*(- zeta^2 + 1)^(1/2))
Mp = simplify(subs(Mp,{L,C,R},{200e-3,10e-6,100}))
Mp = double(Mp)

