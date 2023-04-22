% sample_nyquist1.m
% ナイキスト軌跡の描画（関数 nyquist の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

figure(1)
nyquist(sysP)

