% sample_step_sym_custom.m
% 単位ステップ応答の計算と描画（関数 laplace, ilaplace, fplot の使用例）====> グラスのカスタマイズ

close all

clear
format compact

syms s
syms t real

ut = sym(1)
us = laplace(ut)

Ps = 10/(s^2 + 2*s + 10);

ys = Ps*us
yt = ilaplace(ys)

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
fplot(yt,[0 5],'LineWidth',1.5)

set(gca,'FontSize',14,'FontName','Arial')
set(gca,'XTick',0:1:5)
set(gca,'YTick',0:0.2:1.4)
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('y(t)','FontSize',16,'FontName','Arial')
grid on
