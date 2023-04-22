% sample_residue2.m
% 重解を持つ場合の部分分数分解（関数 residue の使用例）

close all

clear
format compact

num = [2];
den = [1 4 4 0];
[k p] = residue(num,den)
