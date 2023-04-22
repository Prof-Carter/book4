% exercise_02_05.m
% 問題 2.5
% 部分分数分解（重解を含まない場合のヘビサイドの公式）

clear
format compact

disp(' ')
disp(' ***** 問題 2.5 ***************************')
disp(' ***** 関数 residue による部分分数分解 ****')
s = tf('s');
fs = (6*s + 5)/(s*(s^2 + 4*s + 5))

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)




