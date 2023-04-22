% step_2nd_zeta_custom.m
% 2 次遅れ系の単位ステップ応答 ====> グラスのカスタマイズ
% …… ゲインを K = 1，固有角周波数を wn = 1 に固定し，
%      減衰係数を zeta = 0.1, 0.2, ..., 0.9 のように変化

close all

clear
format compact

t = 0:0.001:10;

K = 1;
yinf = K;

wn = 1;
for zeta = 0.1:0.1:0.9
    sysP = tf([K*wn^2],[1 2*zeta*wn wn^2]);
    y = step(sysP,t);
    
    figure(1)
    subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
    plot(t,y,'LineWidth',1.5)
    hold on
    
    S = stepinfo(y,t);
    Tp   = S.PeakTime;
    ymax = S.SettlingMax;
    fprintf('zeta = %2.1f, ',zeta)
    fprintf(  'wn = %2.1f, ',wn)
    fprintf(  'Tp = %4.3e, ',Tp)
    fprintf('Amax = %4.3e\n',ymax-yinf)
end

figure(1)
ylim([0 2])
set(gca,'FontSize',14,'FontName','Arial')
set(gca,'XTick',0:1:10)
set(gca,'YTick',0:0.2:2)
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('y(t)','FontSize',16,'FontName','Arial')
hold off
grid on

