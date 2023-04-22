% example_02_17.m
% �� 2.17
% �C���p���X�����i�֐� impulse�j

close all

clear
format compact

disp(' ')
disp(' ***** �� 2.17 ********************************')
disp(' ***** �֐� step �ɂ��P�ʃX�e�b�v�����̕`�� ***')
sysP = tf([10],[1 2 10])

t = 0:0.001:5;
y = step(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)
ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.9','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)


