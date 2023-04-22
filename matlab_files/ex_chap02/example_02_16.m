% example_02_16.m
% 例 2.16
% 単位ステップ応答

close all

clear
format compact

disp(' ')
disp(' ***** 例 2.16 ********************************')
disp(' ***** 関数 step による単位ステップ応答の描画 ***')
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


