% sample_residue_custom.m
% 部分分数分解（関数 residue の使用例）====> グラスのカスタマイズ

close all

clear
format compact

num = [4 5];
den = [1 3 2];
[k p] = residue(num,den)

t = 0:0.001:10;
y = k(1)*exp(p(1)*t) + k(2)*exp(p(2)*t);

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定

plot(t,y,'LineWidth',1.5)                           % 線の太さ：1.5 ポイント
set(gca,'XTick',0:1:10)                             % 横軸の目盛り
set(gca,'FontSize',14,'FontName','Arial')           % フォントサイズ：14 ポイント，フォント；Arial
xlabel('t [s]','FontSize',16,'FontName','Arial')    % 横軸のラベル（フォントサイズ：16 ポイント，フォント：Arial）
ylabel('y(t)','FontSize',16,'FontName','Arial')     % 縦軸のラベル（フォントサイズ：16 ポイント，フォント：Arial）
grid on                                             % 補助線
