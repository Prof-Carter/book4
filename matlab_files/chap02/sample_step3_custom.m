% sample_step3_custom.m
% 時間指定した単位ステップ応答の計算と描画（関数 step の使用例）====> グラスのカスタマイズ

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;
y = step(sysP,t);

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
plot(t,y,'LineWidth',1.5)

set(gca,'FontSize',14,'FontName','Arial')
set(gca,'XTick',0:1:5)
set(gca,'YTick',0:0.2:1.4)
ylim([0 1.4])
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('y(t)','FontSize',16,'FontName','Arial')
grid on
