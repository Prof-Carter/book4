% step_2nd_sym3.m
% �ߐ����i�� > 1�j�ɂ�����P�ʃX�e�b�v����
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real
syms K zeta wn positive
syms p1 p2 negative

assume(zeta > 1)

disp(' ')
disp(' ********************************************************')
disp(' ***** �@�ߐ����i�� > 1�j�ɂ�����P�ʃX�e�b�v�����@ ******')
disp(' ********************************************************')

disp(' ')
disp(' ---- 2 ���x��n�̓`�B�֐� P(s) ---- ')
Ps = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)
us = 1/s
ys = Ps*us

disp(' ')
disp(' ---- P(s) �̋� p ---- ')
[NPs DPs] = numden(Ps)
p = solve(DPs,s)

disp(' ')
disp(' ---- �P�ʃX�e�b�v���� y(t) ---- ')
Ps = NPs/((s - p1)*(s - p2));
ys = Ps*us
yt = ilaplace(ys)

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t) �̎��Ԕ��� dy(t)/dt ----')
dyt = simplify(diff(yt,t))

