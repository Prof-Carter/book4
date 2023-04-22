% sample_bode2.m
% 周波数領域を指定したボード応答の描画（関数 bode の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

w = logspace(-1,2,10000);

figure(1)
bode(sysP,w)
