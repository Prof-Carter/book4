% internal_stability1.m
% 内部安定性の判別（関数 tfdata, conv, roots の使用例）

clear
format compact

sysP = tf([1],[1 -1]);
sysC = tf([2 1],[1 0]);

[numP denP] = tfdata(sysP,'v');
[numC denC] = tfdata(sysC,'v');

Delta = conv(denP,denC) + conv(numP,numC);
sysDelta = tf(Delta,[1])
roots(Delta)

