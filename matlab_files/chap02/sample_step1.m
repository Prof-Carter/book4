% sample_step1.m
% �P�ʃX�e�b�v�����̕`��i�֐� step �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

figure(1)
step(sysP)
