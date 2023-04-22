% sample_step3.m
% ���Ԏw�肵���P�ʃX�e�b�v�����̌v�Z�ƕ`��i�֐� step �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;
y = step(sysP,t);

figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on