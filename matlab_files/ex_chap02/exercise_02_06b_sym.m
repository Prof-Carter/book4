% exercise_02_06b_sym.m
% 問題 2.6
% 部分分数分解（重解を含む場合）と逆ラプラス変換
% 【Symbolic Math Toolbox】

clear
format compact

syms s
syms t real

disp(' ')
disp(' ***** 問題 2.6 ***************************')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (s + 4)/(s^2 + 4*s + 4)
ft = ilaplace(fs)

disp(' ')
disp(' ***** 問題 2.6 ***************************')
disp(' ***** 関数 partfrac による部分分数分解 ****')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (s + 4)/(s^2 + 4*s + 4)
fs_part = partfrac(fs)
ft = ilaplace(fs_part)


