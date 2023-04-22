% sample_impulse2.m
% 時間指定したインパルス応答の描画（関数 impulse の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

figure(1)
impulse(sysP,t)
