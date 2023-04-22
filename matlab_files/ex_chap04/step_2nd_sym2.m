% step_2nd_sym2.m
% �ՊE�����i�� = 1�j�ɂ�����P�ʃX�e�b�v����
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real
syms K wn positive

zeta = 1;

disp(' ')
disp(' ********************************************************')
disp(' ***** �@�s�������i�� = 1�j�ɂ�����P�ʃX�e�b�v�����@ ******')
disp(' ********************************************************')

disp(' ')
disp(' ---- 2 ���x��n�̓`�B�֐� P(s) ---- ')
Ps = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)
us = 1/s
ys = Ps*us

disp(' ')
disp(' ---- �P�ʃX�e�b�v���� y(t) ---- ')
yt = ilaplace(ys)

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t) �̎��Ԕ��� dy(t)/dt ----')
dyt = simplify(diff(yt,t))

