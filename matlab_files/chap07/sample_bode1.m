% sample_bode1.m
% �{�[�h�����̕`��i�֐� bode �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

figure(1)
bode(sysP)

