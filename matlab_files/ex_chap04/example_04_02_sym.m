% example_04_02_sym.m
% �� 4.2
% �}�X�E�΂ˁE�_���p�n�̒P�ʃX�e�b�v�����ƃI�[�o�[�V���[�g
% �ySymbolic Math Toolbox�z

disp(' ')
disp(' ***** �� 4.2 ********************')

clear
format compact

syms s
syms M c k positive
syms K zeta wn positive

disp(' ')
disp(' ---- �}�X�E�΂ˁE�_���p�n�̓`�B�֐� P(s) ---- ')
Ps = 1/(M*s^2 + c*s + k)

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
disp(' ---- �I�[�o�[�V���[�g�𐶂���悤�� c �͈̔� (M = 1, k = 1) ---- ')
zeta1 = subs(zeta,{M,k},{1,1});
[sol1 params1 conds1] = solve(0 < zeta1 < 1, c, 'ReturnConditions', true);
subs(conds1,c)

disp(' ')
disp(' ---- �I�[�o�[�V���[�g�𐶂���悤�� M �͈̔� (c = 1, k = 1) ---- ')
zeta2 = subs(zeta,{c,k},{1,1});
[sol2 params2 conds2] = solve(0 < zeta2 < 1, M, 'ReturnConditions', true);
subs(conds2,M)


