% example_02_10.m
% 例 2.10
% 部分分数分解（重解を含まない場合のヘビサイドの公式）
clear
format compact

disp(' ')
disp(' ***** 例 2.10 ****************************')
disp(' ***** 関数 residue による部分分数分解 ****')
s = tf('s');
fs = (2*s + 5)/(s*(s^2 + 2*s + 5))

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)



