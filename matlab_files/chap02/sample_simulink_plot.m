% sample_simulink_plot.m
% Simulink ���f�� sim_step.slx �̎��s���ʂ�`�� 

close all

clear
format compact

% sim('sim_step')            % R2019b
% sim('sim_step_R2018a')     % R2018a
% sim('sim_step_R2015a')     % R2015a
% sim('sim_step_R2013a')     % R2013a

figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on
