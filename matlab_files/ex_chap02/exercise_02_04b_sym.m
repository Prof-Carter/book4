% exercise_02_04_sym.m
% 問題 2.4
% 部分分数分解（重解を含まない場合）と逆ラプラス変換
% 【Symbolic Math Toolbox】

clear
format compact

syms s
syms t real

disp(' ')
disp(' ***** 問題 2.4 ***************************')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (5*s + 8)/(s^2 + 3*s + 2)
ft = ilaplace(fs)

disp(' ')
disp(' ***** 問題 2.4 ***************************')
disp(' ***** 関数 partfrac による部分分数分解 ****')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (5*s + 8)/(s^2 + 3*s + 2)
fs_part = partfrac(fs)
ft = ilaplace(fs_part)





