% example_02_18_sym.m
% 例 2.18
% 単位ランプ応答
% 【Symbolic Math Toolbox】

close all

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** 例 2.18 *********************************')
disp(' ***** 関数 partfrac による部分分数分解 *********')
disp(' ***** 関数 ilaplace による単位ランプの計算 *****')
syms s
syms t real
Ps = 1/(s + 1)
ut = sym(t)
us = laplace(ut)
ys = Ps*us
ys = partfrac(ys)
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 5],'LineWidth',1.5)
ylim([0 5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.11','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

