% sample_pole2.m
% ��� 3.3 (2)�F�`�B�֐��̋Ɂi�֐� pole �̎g�p��j

close all

clear
format compact

sysP = tf([1 3 2],[1 4 11 14 10])
pole(sysP)

t = 0:0.001:10;
figure(1); step(sysP,t)