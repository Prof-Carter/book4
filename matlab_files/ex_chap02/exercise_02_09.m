% exersise_02_09.m
% 問題 2.9
% 単位ランプ応答

close all

clear
format compact

disp(' ')
disp(' ***** 問題 2.9 ********************************')
disp(' ***** 関数 lsim による単位ランプ応答の描画 *****')
sysP = tf([3],[1 4 3])

t = 0:0.001:8;
u = t;
y = lsim(sysP,u,t);

figure(1)
plot(t,y,'LineWidth',1.5)
ylim([0 8])

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

