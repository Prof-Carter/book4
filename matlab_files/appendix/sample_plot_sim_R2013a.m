% sample_plot_sim_R2013a.m
% Simulink ���f���̎��s�ƃO���t�̕`��

close all

clear
format compact

sim('sample_R2013a')

figure(1); plot(t,y,'LineWidth',2)

