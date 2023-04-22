% sample_nyquist2.m
% ベクトル軌跡の描画（関数 nyquist の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

figure(1)
nyquist(sysP,options);
ylim([-2 0.5])

