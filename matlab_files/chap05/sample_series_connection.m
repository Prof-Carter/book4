% sample_series_connection.m
% ’¼—ñŒ‹‡

clear
format compact

sysP1 = tf([1],[1 2])
sysP2 = tf([2],[10 1])
sysP = sysP1*sysP2