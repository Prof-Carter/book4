% example_02_15.m
% �� 2.15
% �C���p���X����

close all

clear
format compact

disp(' ')
disp(' ***** �� 2.15 ********************************')
disp(' ***** �֐� impulse �ɂ��C���p���X�����̕`�� **')
sysP = tf([10],[1 2 10])

t = 0:0.001:5;
y = impulse(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)
ylim([-1 3])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.6','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

