% step_2nd_sym2.m
% 臨界制動（ζ = 1）における単位ステップ応答
% 【Symbolic Math Toolbox】

clear
format compact

syms s
syms t real
syms K wn positive

zeta = 1;

disp(' ')
disp(' ********************************************************')
disp(' ***** 　不足制動（ζ = 1）における単位ステップ応答　 ******')
disp(' ********************************************************')

disp(' ')
disp(' ---- 2 次遅れ系の伝達関数 P(s) ---- ')
Ps = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)
us = 1/s
ys = Ps*us

disp(' ')
disp(' ---- 単位ステップ応答 y(t) ---- ')
yt = ilaplace(ys)

disp(' ')
disp(' ----単位ステップ応答 y(t) の時間微分 dy(t)/dt ----')
dyt = simplify(diff(yt,t))

