% example_02_15_sym.m
% �� 2.15
% �C���p���X����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.15 *********************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� *********')
disp(' ***** �֐� ilaplace �ɂ��C���p���X�����̌v�Z **')
syms s
syms t real
Ps = 10/(s^2 + 2*s + 10)
ut = dirac(t)
us = laplace(ut)
ys = Ps*us
ys = partfrac(ys)
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 5],'LineWidth',1.5)
ylim([-1 3])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.6','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)


