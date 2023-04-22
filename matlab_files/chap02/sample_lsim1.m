% sample_lsim1.m
% 任意の時間応答の描画（関数 lsim の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

u = t;
figure(1)
lsim(sysP,u,t)

u = sin(5*t);
figure(2)
lsim(sysP,u,t)
