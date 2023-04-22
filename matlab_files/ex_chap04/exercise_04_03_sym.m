% exercise_04_03_sym.m
% ��� 4.3
% RLC ��H�̒P�ʃX�e�b�v�����ƃI�[�o�[�V���[�g
% �ySymbolic Math Toolbox�z

disp(' ')
disp(' ***** ��� 4.3 ********************')

clear
format compact

syms s
syms R L C positive
syms K zeta wn positive

disp(' ')
disp(' ---- RLC ��H�̓`�B�֐� P(s) ---- ')
Ps = C/(L*C*s^2 + R*C*s + 1)

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
disp(' ---- �I�[�o�[�V���[�g�𐶂���悤�� R �͈̔� ---- ')
[sol params conds] = solve(0 < zeta < 1, R, 'ReturnConditions', true);
subs(conds,R)

