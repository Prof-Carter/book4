% example_02_16_sym.m
% �� 2.16
% �P�ʃX�e�b�v����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.16 *********************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� *********')
disp(' ***** �֐� ilaplace �ɂ��P�ʃX�e�b�v�̌v�Z ***')
syms s
syms t real
Ps = 1/(s + 1)
ut = sym(1)
us = laplace(ut)
ys = Ps*us
ys = partfrac(ys)
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 5],'LineWidth',1.5)
ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.8','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

