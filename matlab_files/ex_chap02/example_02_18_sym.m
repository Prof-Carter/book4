% example_02_18_sym.m
% �� 2.18
% �P�ʃ����v����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.18 *********************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� *********')
disp(' ***** �֐� ilaplace �ɂ��P�ʃ����v�̌v�Z *****')
syms s
syms t real
Ps = 1/(s + 1)
ut = sym(t)
us = laplace(ut)
ys = Ps*us
ys = partfrac(ys)
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 5],'LineWidth',1.5)
ylim([0 5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.11','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

