% sample_simulink_plot_custom.m
% Simulink モデル sim_step.slx の実行結果を描画 ====> グラスのカスタマイズ

close all

clear
format compact

% sim('sim_step')            % R2019b
% sim('sim_step_R2018a')     % R2018a
% sim('sim_step_R2015a')     % R2015a
% sim('sim_step_R2013a')     % R2013a

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
plot(t,y,'LineWidth',1.5)

set(gca,'FontSize',14,'FontName','Arial')
set(gca,'Xtick',0:1:5)
set(gca,'Ytick',0:0.2:1.4)
ylim([0 1.4])
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('y(t)','FontSize',16,'FontName','Arial')
grid on
