% sample_stepinfo2.m
% 例 3.3：単位ステップ応答の過渡特性の指標（関数 stepinfo の使用例）

clear
format compact

sysP = tf([10],[1 2 10])
[numP denP] = tfdata(sysP,'v')
yinf = numP(end)/denP(end)
t = 0:0.001:5;
y = step(sysP,t);
S = stepinfo(y,t,yinf)