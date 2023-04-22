% sample_isstable1.m
% 問題 3.3 (1)：安定性の判別（関数 isstable の使用例）

clear
format compact

sysP = tf([1 10],[1 2 3 10])
isstable(sysP)
