% exercise_02_04.m
% 問題 2.4
% 部分分数分解（重解を含まない場合のヘビサイドの公式）
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 問題 2.4 ***************************')
disp(' ***** 関数 residue による部分分数分解 ****')
s = tf('s');
fs = (5*s + 8)/(s^2 + 3*s + 2)

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)




