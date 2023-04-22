% sample_pole2.m
% 問題 3.3 (2)：伝達関数の極（関数 pole の使用例）

close all

clear
format compact

sysP = tf([1 3 2],[1 4 11 14 10])
pole(sysP)

t = 0:0.001:10;
figure(1); step(sysP,t)