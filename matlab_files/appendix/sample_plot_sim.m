% sample_plot_sim.m
% Simulink ���f���̎��s�ƃO���t�̕`��

close all

clear
format compact

sim('sample')

figure(1); plot(t,y,'LineWidth',2)

