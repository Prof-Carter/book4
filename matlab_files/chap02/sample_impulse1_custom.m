% sample_impulse1.m
% インパルス応答の描画（関数 impulse の使用例）====> グラスのカスタマイズ

close all

clear
format compact

sysP = tf([10],[1 2 10]);

options = timeoptions;

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;
options.Title.String = 'インパルス応答';

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
impulse(sysP,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')
