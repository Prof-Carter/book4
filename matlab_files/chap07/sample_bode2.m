% sample_bode2.m
% ���g���̈���w�肵���{�[�h�����̕`��i�֐� bode �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

w = logspace(-1,2,10000);

figure(1)
bode(sysP,w)
