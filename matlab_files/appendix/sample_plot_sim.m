% sample_plot_sim.m
% Simulink モデルの実行とグラフの描画

close all

clear
format compact

sim('sample')

figure(1); plot(t,y,'LineWidth',2)

