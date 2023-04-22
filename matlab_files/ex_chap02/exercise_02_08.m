% exersise_02_08.m
% 問題 2.8
% 単位ステップ応答

close all

clear
format compact

disp(' ')
disp(' ***** 問題 2.7 ********************************')
disp(' ***** 関数 step による単位ステップ応答の描画 ***')
sysP = tf([3],[1 4 3])

t = 0:0.001:8;
y = step(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)
ylim([0 1.2])

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

