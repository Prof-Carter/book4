% sample_hurwitz1.m
% 問題 3.3 (1)：簡略化したフルビッツの安定判別法（M ファイル hurwitz.m の使用例）

clear
format compact

sysP = tf([1 10],[1 1 4 30])
[numP denP] = tfdata(sysP,'v');
hurwitz