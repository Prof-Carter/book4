% internal_stability2.m
% 内部安定性の判別（関数 zero の使用例）

clear
format compact

sysP = tf([1],[1 -1]);
sysC = tf([2 1],[1 0]);

zero(1 + sysP*sysC)

