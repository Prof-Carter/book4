% sample_isstable2.m
% 問題 3.3 (2)：安定性の判別（関数 isstable の使用例）

clear
format compact

sysP = tf([1 3 2],[1 4 11 14 10])
isstable(sysP)