% sample_bode1_custom.m
% ボード応答の描画（関数 bodeplot の使用例）====> グラスのカスタマイズ

close all

clear
format compact

sysP = tf([10],[1 2 10]);

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])

options = bodeoptions('cstprefs');
options.TickLabel.Color = [0 0 0];

h = bodeplot(sysP,options);

p = getoptions(h);
p.TickLabel.FontSize = 14;
p.YLabel.FontSize = 16;
p.YLimMode = 'manual';
p.YLim{1} = [-60 10];
p.YLim{2} = [-180 0];
p.XLimMode = 'manual';
p.XLim{1} = [1e-1 1e2];
% p.Grid='on';
p.Xlabel.FontSize = 16;
p.Title.FontSize = 16;
setoptions(h,p)

h2 = findobj(gcf,'type','Line');
set(h2,'LineWidth',1.5)

