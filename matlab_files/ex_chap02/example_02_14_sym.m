% example_02_14_sym.m
% �� 2.14
% �C���p���X����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.14 *********************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� *********')
disp(' ***** �֐� ilaplace �ɂ��C���p���X�����̌v�Z **')
syms s
syms t real
Ps = 1/(s + 1)
ut = dirac(t)
us = laplace(ut)
ys = Ps*us
ys = partfrac(ys)
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 5],'LineWidth',1.5)
ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.5','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

