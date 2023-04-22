% step_1st_K_custom.m
% 1 次遅れ系の単位ステップ応答 ====> グラスのカスタマイズ
% …… 時定数を T = 1 に固定し，ゲインを K = 0.5, 1, 1.5, 2 のように変化

close all

clear
format compact

t = 0:0.001:5;

T = 1;
for K = 0.5:0.5:2
    sysP = tf([K],[T 1]);
    y = step(sysP,t);
    
    figure(1)
    subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
    plot(t,y,'LineWidth',1.5)
    hold on
    plot(T,0.632*K,'ko','LineWidth',1.5,'MarkerSize',10)
    plot([0 5],0.632*K*[1 1],'k:')
end

figure(1)
plot(T*[1 1],K*[0 1],'k:')
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',0:0.2:2)
set(gca,'FontSize',14,'FontName','Arial')
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('y(t)','FontSize',16,'FontName','Arial')
hold off