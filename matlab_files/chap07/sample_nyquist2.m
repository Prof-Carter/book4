% sample_nyquist2.m
% �x�N�g���O�Ղ̕`��i�֐� nyquist �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' �x�N�g���O��';

figure(1)
nyquist(sysP,options);
ylim([-2 0.5])

