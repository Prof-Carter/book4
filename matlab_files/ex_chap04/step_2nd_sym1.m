% step_2nd_sym1.m
% �s�������i0 < �� < 1�j�ɂ�����P�ʃX�e�b�v�����Ɖߓn�����̎w�W
% �ySymbolic Math Toolbox�z

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
disp(' ***** �@�s�������i0 < �� < 1�j�ɂ�����@ *******')
disp(' ***** �@�P�ʃX�e�b�v�����Ɖߓn�����̎w�W�@ ******')
disp(' **********************************************')

disp(' ')
disp(' ---- 2 ���x��n�̓`�B�֐� P(s) ---- ')
Ps = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)
us = 1/s
ys = Ps*us

disp(' ')
disp(' ---- �P�ʃX�e�b�v���� y(t) ---- ')
yt = ilaplace(ys)

yt2 = subs(yt,wn*(1 - zeta^2)^(1/2),wd)

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t) �̎��Ԕ��� dy(t)/dt ----')
dyt = simplify(diff(yt,t))

disp(' ')
disp(' ---- dy(t)/dt = 0 �̉� t = t_l (l = 0, 1, 2, ...) ----')
assume(t >= 0);
[t_l params conds] = solve(dyt, t, 'ReturnConditions', true)

disp(' ')
disp(' ---- ���l yinf ----')
yinf = subs(Ps,s,0)

disp(' ')
disp(' ---- �s���߂����� Tp ----')
Tp   = subs(t_l,l,1)

disp(' ')
disp(' ---- �I�[�o�[�V���[�g Amax ----')
Amax = subs(yt,t,Tp) - yinf

disp(' ')
disp(' ---- �ɑ�l�ƂȂ鎞�� t1_bar, t2_bar, t3_bar, ... ----')
t1_bar = subs(t_l,l,1)
t2_bar = subs(t_l,l,3)
t3_bar = subs(t_l,l,5)

disp(' ')
disp(' ---- �U������ T ----')
T = t2_bar - t1_bar

disp(' ')
disp(' ---- �ɑ�l A1, A2, A3, ... ----')
A1 = subs(yt,t,t1_bar) - yinf
A2 = subs(yt,t,t2_bar) - yinf
A3 = subs(yt,t,t3_bar) - yinf

disp(' ')
disp(' ---- ������ lambda ----')
lambda = simplify(A2/A1)
