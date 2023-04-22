% step_2nd_sym1.m
% 不足制動（0 < ζ < 1）における単位ステップ応答と過渡特性の指標
% 【Symbolic Math Toolbox】

clear
format compact

syms s
syms t real
syms K zeta wn positive
syms wd real
syms l integer

assume(0 < zeta < 1)

disp(' ')
disp(' **********************************************')
disp(' ***** 　不足制動（0 < ζ < 1）における　 *******')
disp(' ***** 　単位ステップ応答と過渡特性の指標　 ******')
disp(' **********************************************')

disp(' ')
disp(' ---- 2 次遅れ系の伝達関数 P(s) ---- ')
Ps = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)
us = 1/s
ys = Ps*us

disp(' ')
disp(' ---- 単位ステップ応答 y(t) ---- ')
yt = ilaplace(ys)

yt2 = subs(yt,wn*(1 - zeta^2)^(1/2),wd)

disp(' ')
disp(' ----単位ステップ応答 y(t) の時間微分 dy(t)/dt ----')
dyt = simplify(diff(yt,t))

disp(' ')
disp(' ---- dy(t)/dt = 0 の解 t = t_l (l = 0, 1, 2, ...) ----')
assume(t >= 0);
[t_l params conds] = solve(dyt, t, 'ReturnConditions', true)

disp(' ')
disp(' ---- 定常値 yinf ----')
yinf = subs(Ps,s,0)

disp(' ')
disp(' ---- 行き過ぎ時間 Tp ----')
Tp   = subs(t_l,l,1)

disp(' ')
disp(' ---- オーバーシュート Amax ----')
Amax = subs(yt,t,Tp) - yinf

disp(' ')
disp(' ---- 極大値となる時刻 t1_bar, t2_bar, t3_bar, ... ----')
t1_bar = subs(t_l,l,1)
t2_bar = subs(t_l,l,3)
t3_bar = subs(t_l,l,5)

disp(' ')
disp(' ---- 振動周期 T ----')
T = t2_bar - t1_bar

disp(' ')
disp(' ---- 極大値 A1, A2, A3, ... ----')
A1 = subs(yt,t,t1_bar) - yinf
A2 = subs(yt,t,t2_bar) - yinf
A3 = subs(yt,t,t3_bar) - yinf

disp(' ')
disp(' ---- 減衰率 lambda ----')
lambda = simplify(A2/A1)
