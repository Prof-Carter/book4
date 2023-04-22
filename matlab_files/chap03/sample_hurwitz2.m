% sample_hurwitz2.m
% 問題 3.3 (2)：簡略化したフルビッツの安定判別法（M ファイル hurwitz.m の使用例）

clear
format compact

sysP = tf([1 3 2],[1 4 11 14 10])
[numP denP] = tfdata(sysP,'v');
hurwitz