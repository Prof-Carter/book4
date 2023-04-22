% exersise_02_08.m
% ��� 2.8
% �P�ʃX�e�b�v����

close all

clear
format compact

disp(' ')
disp(' ***** ��� 2.7 ********************************')
disp(' ***** �֐� step �ɂ��P�ʃX�e�b�v�����̕`�� ***')
sysP = tf([3],[1 4 3])

t = 0:0.001:8;
y = step(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)
ylim([0 1.2])

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

