% exercise_07_10_sym.m
% ��� 7.10
% RLC ��H�̎��g�������i���U�̉�́j
% �ySymbolic Math Toolbox�z

disp(' ')
disp(' ***** ��� 7.10 (1) ********************')

clear
format compact

syms s
syms R L C positive
syms K zeta wn positive

disp(' ')
disp(' ---- RLC ��H�̓`�B�֐� P(s) ---- ')
Ps = 1/(L*C*s^2 + R*C*s + 1)

disp(' ')
disp(' ---- 1/P(s) ---- ')
inv_Ps = expand(1/Ps)

disp(' ')
disp(' ---- 1/P(s) �̌W�� ---- ')
coefficient = coeffs(inv_Ps,s)

disp(' ')
disp(' ---- 2 ���x��n�̓`�B�֐� P2(s) ---- ')
Ps2 = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)

disp(' ')
disp(' ---- 1/P2(s) ---- ')
inv_Ps2 = expand(1/Ps2)

disp(' ')
disp(' ---- 1/P2(s) �̌W�� ---- ')
coefficient2 = coeffs(inv_Ps2,s)

disp(' ')
disp(' ---- K, zeta, wn (1/P(s) = 1/P2(s) �ƂȂ�悤�Ɍ���) ---- ')
eqns = coefficient - coefficient2;
sol = solve(eqns, {K,zeta,wn}, 'ReturnConditions', true);

K    = sol.K
zeta = sol.zeta
wn   = sol.wn

disp(' ')
disp(' ---- �I�[�o�[�V���[�g�𐶂��Ȃ��悤�� R �͈̔� ---- ')
[sol params conds] = solve(zeta >= 1/sqrt(2), R, 'ReturnConditions', true);
conds = subs(conds,R)

disp(' ')
disp(' ---- �I�[�o�[�V���[�g�𐶂��Ȃ��悤�� R �͈̔́iL = 200 [mH], C = 10 [��F]�j ---- ')
simplify(subs(conds,{L,C},{200e-3,10e-6}),'Steps',50)


disp(' ')
disp(' ***** ��� 7.10 (2) ********************')
disp(' ')
disp(' ---- �s�[�N�p���g�� wp ---- ')
wp = wn*(1 - 2*zeta^2)^(1/2)
wp = simplify(subs(wp,{L,C,R},{200e-3,10e-6,100}))
wp = double(wp)

disp(' ')
disp(' ---- ���U�s�[�N Mp ---- ')
Mp = 1/(2*zeta*(- zeta^2 + 1)^(1/2))
Mp = simplify(subs(Mp,{L,C,R},{200e-3,10e-6,100}))
Mp = double(Mp)

