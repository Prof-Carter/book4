% sample_step1.m
% 単位ステップ応答の描画（関数 step の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

figure(1)
step(sysP)
