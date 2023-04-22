% sample_initial
% 鉛直面を回転するアームの零入力応答（関数 initial の使用例）====> グラスのカスタマイズ

close all

clear
format compact

arm_para

A = [    0       1
     -M*g*l/J  -c/J ];
C = [ 1  0 ];
sys0 = ss(A,[],C,[]);

x0 = [ 1  0 ]';

options = timeoptions;

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;
options.Title.String = '初期条件への応答';

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
initial(sys0,x0,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')

set(gca,'xtick',0:1:6)
set(gca,'ytick',0:0.1:1)
