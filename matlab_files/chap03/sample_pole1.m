% sample_pole1.m
% ��� 3.3 (1)�F�`�B�֐��̋Ɂi�֐� pole �̎g�p��j

close all

clear
format compact

sysP = tf([1 10],[1 2 3 10])
pole(sysP)

t = 0:0.001:10;
figure(1); step(sysP,t)