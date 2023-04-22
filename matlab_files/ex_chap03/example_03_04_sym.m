% example_03_04_sym.m
% 例 3.4
% 代表極：過制動の 2 次遅れ系の単位ステップ応答の過渡特性
% 【Symbolic Math Toolbox】

close all

clear
format compact

disp(' ')
disp(' ***** 例 3.4 ********************')

syms s
syms t real
syms tau positive

disp(' ')
disp(' ---- 過制動の 2 次遅れ要素 ----')
Ps = 1/((s + 1)*(tau*s + 1))

disp(' ')
disp(' ---- P(s) の極 ----')
[numP denP] = numden(Ps);
solve(denP,s)
disp(' ')

ut = sym(1)
us = laplace(ut)
ys = Ps*us

disp(' ')
disp(' ----単位ステップ応答 y(t)：2 次遅れ系 ----')
yt = ilaplace(ys)

% ------------------------------------------------------------
disp(' ')
disp(' ----単位ステップ応答 y(t)：2 次遅れ系 (tau = 0.1) ----')
yt_2nd = subs(yt,tau,0.1)


disp(' ')
disp(' ----単位ステップ応答 y(t)：1 次遅れ系 ----')
Ps_1st = 1/(s + 1);
ys_1st = Ps_1st*us;
yt_1st = ilaplace(ys_1st)


figure(1)
fplot(yt_2nd,[0 5],'LineWidth',1.5)
hold on
fplot(yt_1st,[0 5],'LineWidth',1.5)
hold off

ylim([0 1.25])
set(gca,'YTick',0:0.25:1.25)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 3.6','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend('$P(s) = \displaystyle\frac{1}{(s + 1)(0.1s + 1)}$','$\tilde{P}(s) = \displaystyle\frac{1}{s + 1}$')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on
