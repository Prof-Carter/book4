% exersise_02_07.m
% ��� 2.7
% �C���p���X����

close all

clear
format compact

disp(' ')
disp(' ***** ��� 2.7 ********************************')
disp(' ***** �֐� impulse �ɂ��C���p���X�����̕`�� **')
sysP = tf([3],[1 4 3])

t = 0:0.001:8;
y = impulse(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)
ylim([0 0.6])

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

