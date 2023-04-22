% example_02_16.m
% �� 2.16
% �P�ʃX�e�b�v����

close all

clear
format compact

disp(' ')
disp(' ***** �� 2.16 ********************************')
disp(' ***** �֐� step �ɂ��P�ʃX�e�b�v�����̕`�� ***')
sysP = tf([1],[1 1])

t = 0:0.001:5;
y = step(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)
ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.8','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)


