% sample_margin.m
% 安定余裕の計算とボード応答の描画（関数 margin の使用例）

close all

clear
format compact

sysP = tf([1],[1 1])^3;
kP = 2; sysC = kP;
sysL = sysP*sysC;

[inv_Ljwpc Pm wpc wgc] = margin(sysL)
Gm = 20*log10(inv_Ljwpc)

figure(1); margin(sysL)

