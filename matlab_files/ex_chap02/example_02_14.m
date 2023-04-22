% example_02_14.m
% 例 2.14
% インパルス応答

close all

clear
format compact

disp(' ')
disp(' ***** 例 2.14 ********************************')
disp(' ***** 関数 impulse によるインパルス応答の描画 **')
sysP = tf([1],[1 1])

t = 0:0.001:5;
y = impulse(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)
ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.5','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

