% sample_margin.m
% ����]�T�̌v�Z�ƃ{�[�h�����̕`��i�֐� margin �̎g�p��j

close all

clear
format compact

sysP = tf([1],[1 1])^3;
kP = 2; sysC = kP;
sysL = sysP*sysC;

[inv_Ljwpc Pm wpc wgc] = margin(sysL)
Gm = 20*log10(inv_Ljwpc)

figure(1); margin(sysL)

