% example_02_18.m
% �� 2.18
% �P�ʃ����v����

close all

clear
format compact

disp(' ')
disp(' ***** �� 2.18 ********************************')
disp(' ***** �֐� lsim �ɂ��P�ʃ����v�����̕`�� *****')
sysP = tf([1],[1 1])

t = 0:0.001:5;
u = t;
y = lsim(sysP,u,t);

figure(1)
plot(t,y,'LineWidth',1.5)
hold on
plot(t,t-1)
hold off

ylim([0 5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.11','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend('$y(t)$','$t - 1$')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

