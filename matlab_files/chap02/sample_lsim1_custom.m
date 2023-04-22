% sample_lsim1_custom.m
% 任意の時間応答の描画（関数 lsim の使用例）====> グラスのカスタマイズ

close all

clear
format compact

sysP = tf([10],[1 2 10]);

options = timeoptions;

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;
options.Title.String = '線形シミュレーションの結果';

t = 0:0.001:5;

% ---------------------
u = t;
figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
lsim(sysP,u,t,options)
h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','arial')

% ---------------------
u = sin(5*t);
figure(2)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
lsim(sysP,u,t,options)
h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')
