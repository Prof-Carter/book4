% sample_impulse2.m
% ���Ԏw�肵���C���p���X�����̕`��i�֐� impulse �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

figure(1)
impulse(sysP,t)
