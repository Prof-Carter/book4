% exercise_04_01_sym.m
% ��� 4.1
% RL ��H�̉ߓn����
% �ySymbolic Math Toolbox�z

disp(' ')
disp(' ***** ��� 4.1 (1) ********************')

clear
format compact

syms s
syms R L positive
syms K T positive
syms E0 real

disp(' ')
disp(' ---- RL ��H�̓`�B�֐� P(s) ---- ')
Ps = 1/(L*s + R)

disp(' ')
disp(' ---- 1/P(s) ---- ')
inv_Ps = expand(1/Ps)

disp(' ')
disp(' ---- 1/P(s) �̌W�� ---- ')
coefficient = coeffs(inv_Ps,s)

disp(' ')
disp(' ---- 1 ���x��n�̓`�B�֐� P2(s) ---- ')
Ps2 = K/(1 + T*s)

disp(' ')
disp(' ---- 1/P2(s) ---- ')
inv_Ps2 = expand(1/Ps2)

disp(' ')
disp(' ---- 1/P2(s) �̌W�� ---- ')
coefficient2 = coeffs(inv_Ps2,s)

disp(' ')
disp(' ---- K, T (1/P(s) = 1/P2(s) �ƂȂ�悤�Ɍ���) ---- ')
eqns = coefficient - coefficient2;
sol = solve(eqns, {K,T}, 'ReturnConditions', true);

K = sol.K
T = sol.T


disp(' ')
disp(' ***** ��� 4.1 (2) ********************')
us = E0/s
ys = Ps*us

disp(' ')
disp(' ---- y(t) = i(t) ---- ')
yt = ilaplace(ys)

disp(' ')
disp(' ---- y�� = i�� ---- ')
yinf = limit(yt,Inf)


