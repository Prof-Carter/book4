% sample_bode1.m
% ボード応答の描画（関数 bode の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

figure(1)
bode(sysP)

