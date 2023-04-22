% sample_pole1_custom.m
% 問題 3.3 (1)：伝達関数の極（関数 pole の使用例）====> グラスのカスタマイズ

close all

clear
format compact

sysP = tf([1 10],[1 2 3 10])
pole(sysP)

t = 0:0.001:10;
options = timeoptions;

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;
options.Title.String = 'ステップ応答';

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
step(sysP,t,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')
