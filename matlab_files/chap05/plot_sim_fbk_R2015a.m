% plot_sim_fbk_R2015a.m
% Simulink ���p�����t�@�[�h�o�b�N����̃V�~�����[�V����

close all

clear
format compact

sim('sim_fbk_R2015a')

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