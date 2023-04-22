% plot_sim_fbk_R2013a.m
% Simulink 利用したファードバック制御のシミュレーション

close all

clear
format compact

sim('sim_fbk_R2013a')

figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on

figure(2)
plot(t,e)
xlabel('t [s]')
ylabel('e(t)')
grid on