% exercise_03_05_sym.m
% ��� 3.5
% ��_�����V�X�e���̉ߓn����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

disp(' ')
disp(' ***** ��� 3.5 ********************')

syms s
syms t real

disp(' ')
disp(' ---- ��_�����V�X�e���̓`�B�֐� ----')
Ps = (6*s + 3)/((s + 1)*(s + 3))

[numP denP] = numden(Ps);
disp(' ')
disp(' ---- P(s) �̋� ----')
solve(denP,s)
disp(' ---- P(s) �̗�_ ----')
solve(numP,s)
disp(' ')

ut = sym(1)
us = laplace(ut)
ys = Ps*us

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t) ----')
yt = ilaplace(ys)

disp(' ')
disp(' ---- ���l yinf ----')
yinf = subs(Ps,s,0)

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t) �̎��Ԕ��� dy(t)/dt ----')
dyt = simplify(diff(yt))

disp(' ')
disp(' ---- dy(t)/dt = 0 �̉� t = Tp ----')
assume(t > 0);
[Tp params conds] = solve(dyt, t, 'ReturnConditions', true);
Tp

disp(' ')
disp(' ---- y(Tp) ----')
y_Tp = simplify(subs(yt,t,Tp))

disp(' ')
disp(' ---- �I�[�o�[�V���[�g Amax = y(Tp) - yinf ----')
Amax = simplify(y_Tp - yinf)

% ------------------------------------------------------------
figure(1)
fplot(yt,[0 5],'LineWidth',1.5)
hold on

plot(Tp,y_Tp,'k.','MarkerSize',25)
hold off   

ylim([0 1.5])
set(gca,'YTick',0:0.25:1.5)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

grid on

