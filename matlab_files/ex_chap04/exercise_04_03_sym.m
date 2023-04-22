% exercise_04_03_sym.m
% 問題 4.3
% RLC 回路の単位ステップ応答とオーバーシュート
% 【Symbolic Math Toolbox】

disp(' ')
disp(' ***** 問題 4.3 ********************')

clear
format compact

syms s
syms R L C positive
syms K zeta wn positive

disp(' ')
disp(' ---- RLC 回路の伝達関数 P(s) ---- ')
Ps = C/(L*C*s^2 + R*C*s + 1)

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
disp(' ---- オーバーシュートを生じるような R の範囲 ---- ')
[sol params conds] = solve(0 < zeta < 1, R, 'ReturnConditions', true);
subs(conds,R)

