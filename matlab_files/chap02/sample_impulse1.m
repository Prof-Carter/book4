% sample_impulse1.m
% �C���p���X�����̕`��i�֐� impulse �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

figure(1)
impulse(sysP)
