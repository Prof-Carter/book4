% sample_nyquist1.m
% �i�C�L�X�g�O�Ղ̕`��i�֐� nyquist �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

figure(1)
nyquist(sysP)

