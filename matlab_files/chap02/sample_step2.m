% sample_step2.m
% ���Ԏw�肵���P�ʃX�e�b�v�����̕`��i�֐� step �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

figure(1)
step(sysP,t)
