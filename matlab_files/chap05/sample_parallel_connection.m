% sample_parallel_connection.m
% ï¿óÒåãçá

clear
format compact

sysP1 = tf([1],[1 2])
sysP2 = tf([2],[10 1])
sysP = sysP1 + sysP2