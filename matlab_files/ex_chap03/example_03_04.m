% example_03_04.m
% �� 3.4
% ��\�ɁF�ߐ����� 2 ���x��n�̒P�ʃX�e�b�v�����̉ߓn����

close all

clear
format compact

disp(' ')
disp(' ***** �� 3.4 ********************')

t = 0:0.001:5;
s = tf('s');

% ------------------------------------------------------------
disp(' ')
disp(' ---- �ߐ����� 2 ���x��v�f (tau = 0.1) ----')
tau = 0.1
sysP_2nd = 1/((s + 1)*(tau*s + 1))

disp(' ')
disp(' ---- P(s) �̋� ----')
pole(sysP_2nd)
disp(' ')

y_2nd = step(sysP_2nd,t);

% ------------------------------------------------------------
disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t)�F1 ���x��n ----')
sysP_1st = 1/(s + 1);

disp(' ')
disp(' ---- P(s) �̋� ----')
pole(sysP_1st)
disp(' ')

y_1st = step(sysP_1st,t);

% ------------------------------------------------------------
figure(1)
plot(t,y_2nd,'LineWidth',1.5)
hold on
plot(t,y_1st,'LineWidth',1.5)
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
