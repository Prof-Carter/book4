% exersise_02_07.m
% 問題 2.7
% インパルス応答

close all

clear
format compact

disp(' ')
disp(' ***** 問題 2.7 ********************************')
disp(' ***** 関数 impulse によるインパルス応答の描画 **')
sysP = tf([3],[1 4 3])

t = 0:0.001:8;
y = impulse(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)
ylim([0 0.6])

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

