% exercise_02_05_sym.m
% 問題 2.5
% 部分分数分解（重解を含まない場合）と逆ラプラス変換
% 【Symbolic Math Toolbox】

clear
format compact

syms s
syms t real

disp(' ')
disp(' ***** 問題 2.5 ***************************')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (6*s + 5)/(s*(s^2 + 4*s + 5))
ft = ilaplace(fs)

disp(' ')
disp(' ***** 問題 2.5 ***************************')
disp(' ***** 関数 partfrac による部分分数分解 ****')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (6*s + 5)/(s*(s^2 + 4*s + 5))
fs_part = partfrac(fs)
ft = ilaplace(fs_part)




