% sample_plot_sim_R2015a.m
% Simulink モデルの実行とグラフの描画

close all

clear
format compact

sim('sample_R2015a')

figure(1); plot(t,y,'LineWidth',2)

