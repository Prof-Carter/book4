% exersise_02_09_sym.m
% ��� 2.9
% �P�ʃ����v����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

disp(' ')
disp(' ***** ��� 2.9 *********************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� *********')
disp(' ***** �֐� ilaplace �ɂ��P�ʃ����v�̌v�Z *****')
syms s
syms t real
Ps = 3/(s^2 + 4*s + 3)
ut = sym(t)
us = laplace(ut)
ys = Ps*us
ys = partfrac(ys)
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 8],'LineWidth',1.5)
ylim([0 8])

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

