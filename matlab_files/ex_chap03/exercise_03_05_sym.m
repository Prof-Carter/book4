% exercise_03_05_sym.m
% 問題 3.5
% 零点を持つシステムの過渡特性
% 【Symbolic Math Toolbox】

close all

clear
format compact

disp(' ')
disp(' ***** 問題 3.5 ********************')

syms s
syms t real

disp(' ')
disp(' ---- 零点を持つシステムの伝達関数 ----')
Ps = (6*s + 3)/((s + 1)*(s + 3))

[numP denP] = numden(Ps);
disp(' ')
disp(' ---- P(s) の極 ----')
solve(denP,s)
disp(' ---- P(s) の零点 ----')
solve(numP,s)
disp(' ')

ut = sym(1)
us = laplace(ut)
ys = Ps*us

disp(' ')
disp(' ----単位ステップ応答 y(t) ----')
yt = ilaplace(ys)

disp(' ')
disp(' ---- 定常値 yinf ----')
yinf = subs(Ps,s,0)

disp(' ')
disp(' ----単位ステップ応答 y(t) の時間微分 dy(t)/dt ----')
dyt = simplify(diff(yt))

disp(' ')
disp(' ---- dy(t)/dt = 0 の解 t = Tp ----')
assume(t > 0);
[Tp params conds] = solve(dyt, t, 'ReturnConditions', true);
Tp

disp(' ')
disp(' ---- y(Tp) ----')
y_Tp = simplify(subs(yt,t,Tp))

disp(' ')
disp(' ---- オーバーシュート Amax = y(Tp) - yinf ----')
Amax = simplify(y_Tp - yinf)

% ------------------------------------------------------------
figure(1)
fplot(yt,[0 5],'LineWidth',1.5)
hold on

plot(Tp,y_Tp,'k.','MarkerSize',25)
hold off   

ylim([0 1.5])
set(gca,'YTick',0:0.25:1.5)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

grid on

