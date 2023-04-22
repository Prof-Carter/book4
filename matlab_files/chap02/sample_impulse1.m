% sample_impulse1.m
% インパルス応答の描画（関数 impulse の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

figure(1)
impulse(sysP)
