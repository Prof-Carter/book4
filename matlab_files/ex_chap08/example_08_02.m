% example_08_02.m
% 例 8.2
% ナイキスト軌跡の描画

close all

clear
format compact

s = tf('s');
sysL = (- s + 6)/((s + 4)*(s - 1))

options = nyquistoptions;

options.Title.FontSize  = 14;
options.XLabel.FontSize = 14;
options.YLabel.FontSize = 14;
options.TickLabel.FontSize = 12;

figure(1)
nyquist(sysL,options)
hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

set(gca,'FontName','Arial')

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)




