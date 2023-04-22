% example_02_09.m
% 例 2.9
% 部分分数分解（重解を含まない場合のヘビサイドの公式）
clear
format compact

disp(' ')
disp(' ***** 例 2.9 ****************************')
disp(' ***** 関数 residue による部分分数分解 ****')
s = tf('s');
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)


