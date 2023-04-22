% example_03_04_sym.m
% �� 3.4
% ��\�ɁF�ߐ����� 2 ���x��n�̒P�ʃX�e�b�v�����̉ߓn����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

disp(' ')
disp(' ***** �� 3.4 ********************')

syms s
syms t real
syms tau positive

disp(' ')
disp(' ---- �ߐ����� 2 ���x��v�f ----')
Ps = 1/((s + 1)*(tau*s + 1))

disp(' ')
disp(' ---- P(s) �̋� ----')
[numP denP] = numden(Ps);
solve(denP,s)
disp(' ')

ut = sym(1)
us = laplace(ut)
ys = Ps*us

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t)�F2 ���x��n ----')
yt = ilaplace(ys)

% ------------------------------------------------------------
disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t)�F2 ���x��n (tau = 0.1) ----')
yt_2nd = subs(yt,tau,0.1)


disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t)�F1 ���x��n ----')
Ps_1st = 1/(s + 1);
ys_1st = Ps_1st*us;
yt_1st = ilaplace(ys_1st)


figure(1)
fplot(yt_2nd,[0 5],'LineWidth',1.5)
hold on
fplot(yt_1st,[0 5],'LineWidth',1.5)
hold off

ylim([0 1.25])
set(gca,'YTick',0:0.25:1.25)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 3.6','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend('$P(s) = \displaystyle\frac{1}{(s + 1)(0.1s + 1)}$','$\tilde{P}(s) = \displaystyle\frac{1}{s + 1}$')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on
