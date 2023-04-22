% example_06_01b_sym.m
% �� 6.1
% �}�X�E�΂ˁE�_���p�n�� P ����iwn = wm �ƂȂ�悤�� kP �̐݌v�ƊO�������̒������j
% �ySymbolic Math Toolbox�z

clear
format compact

disp(' ')
disp(' ***** �� 6.1�i�O�������j ********************')

syms s
syms a1 a0 b0 real
syms kP real
syms zeta wn K2 positive
syms wm positive

disp(' ')
disp(' ---- �}�X�E�΂ˁE�_���p�n�̓`�B�֐� P(s) ---- ')
Ps = b0/(s^2 + a1*s + a0)
disp(' ')
disp(' ---- P �R���g���[�� C(s) ---- ')
Cs = kP

disp(' ')
disp(' ---- Gyd(s) ---- ')
Gyd = collect(Ps/(1 + Ps*Cs),s)

[numGyd denGyd] = numden(Gyd)
coefficient = coeffs(denGyd,s)

disp(' ')
disp(' ---- 2 ���x��n�̓`�B�֐� Gyd2(s) ---- ')
Gyd2 = K2*wn^2/(s^2 + 2*zeta*wn*s + wn^2)

[numGyd2 denGyd2] = numden(Gyd2)
coefficient2 = coeffs(denGyd2,s)

disp(' ')
disp(' ---- K1, zeta, wn (Gyd(s) = Gyd2(s) �ƂȂ�悤�Ɍ���) ---- ')
K2 = simplify(subs(Gyd,s,0))

eqns = coefficient(1:2) - coefficient2(1:2);
sol = solve(eqns, {wn,zeta}, 'ReturnConditions', true);

zeta = simplify(sol.zeta)
wn   = simplify(sol.wn)

disp(' ')
disp(' ---- wn = wm �ƂȂ�悤�� kP ---- ')
sol_kP = solve(wn-wm, kP)

disp(' ')
disp(' ---- �O�������̒��l ys ---- ')
ys = subs(Gyd,s,0)



