% example_02_16_sym.m
% 例 2.16
% 単位ステップ応答
% 【Symbolic Math Toolbox】

close all

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** 例 2.16 *********************************')
disp(' ***** 関数 partfrac による部分分数分解 *********')
disp(' ***** 関数 ilaplace による単位ステップの計算 ***')
syms s
syms t real
Ps = 1/(s + 1)
ut = sym(1)
us = laplace(ut)
ys = Ps*us
ys = partfrac(ys)
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 5],'LineWidth',1.5)
ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.8','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

