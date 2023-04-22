% example_02_15_sym.m
% 例 2.15
% インパルス応答
% 【Symbolic Math Toolbox】

close all

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** 例 2.15 *********************************')
disp(' ***** 関数 partfrac による部分分数分解 *********')
disp(' ***** 関数 ilaplace によるインパルス応答の計算 **')
syms s
syms t real
Ps = 10/(s^2 + 2*s + 10)
ut = dirac(t)
us = laplace(ut)
ys = Ps*us
ys = partfrac(ys)
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 5],'LineWidth',1.5)
ylim([-1 3])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 2.6','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)


