% sample_step2.m
% 時間指定した単位ステップ応答の描画（関数 step の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

figure(1)
step(sysP,t)
