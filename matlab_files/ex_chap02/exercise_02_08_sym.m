% exersise_02_08_sym.m
% 問題 2.8
% 単位ステップ応答
% 【Symbolic Math Toolbox】

close all

clear
format compact

disp(' ')
disp(' ***** 問題 2.8 *********************************')
disp(' ***** 関数 partfrac による部分分数分解 *********')
disp(' ***** 関数 ilaplace による単位ステップの計算 ***')
syms s
syms t real
Ps = 3/(s^2 + 4*s + 3)
ut = sym(1)
us = laplace(ut)
ys = Ps*us
ys = partfrac(ys)
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 8],'LineWidth',1.5)
ylim([0 1.2])

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

