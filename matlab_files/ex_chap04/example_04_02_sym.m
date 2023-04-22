% example_04_02_sym.m
% 例 4.2
% マス・ばね・ダンパ系の単位ステップ応答とオーバーシュート
% 【Symbolic Math Toolbox】

disp(' ')
disp(' ***** 例 4.2 ********************')

clear
format compact

syms s
syms M c k positive
syms K zeta wn positive

disp(' ')
disp(' ---- マス・ばね・ダンパ系の伝達関数 P(s) ---- ')
Ps = 1/(M*s^2 + c*s + k)

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
disp(' ---- オーバーシュートを生じるような c の範囲 (M = 1, k = 1) ---- ')
zeta1 = subs(zeta,{M,k},{1,1});
[sol1 params1 conds1] = solve(0 < zeta1 < 1, c, 'ReturnConditions', true);
subs(conds1,c)

disp(' ')
disp(' ---- オーバーシュートを生じるような M の範囲 (c = 1, k = 1) ---- ')
zeta2 = subs(zeta,{c,k},{1,1});
[sol2 params2 conds2] = solve(0 < zeta2 < 1, M, 'ReturnConditions', true);
subs(conds2,M)


