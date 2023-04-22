% exercise_02_06.m
% 問題 2.6
% 部分分数分解（重解を含む場合のヘビサイドの公式）

clear
format compact

disp(' ')
disp(' ***** 問題 2.6 ***************************')
disp(' ***** 関数 residue による部分分数分解 ****')
s = tf('s');
fs = (s + 4)/(s^2 + 4*s + 4)

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)

