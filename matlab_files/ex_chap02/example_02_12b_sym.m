% example_02_12b_sym.m
% 例 2.12 / 例 2.13
% 部分分数分解（重解を含む場合）と逆ラプラス変換
% 【Symbolic Math Toolbox】

clear
format compact

syms s

disp(' ')
disp(' ***** 例 2.12 / 例 2.13 ******************')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (2*s + 1)/(s*(s + 1)^2)
ft = ilaplace(fs)

disp(' ')
disp(' ***** 例 2.12 / 例 2.13 ******************')
disp(' ***** 関数 partfrac による部分分数分解 ****')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (2*s + 1)/(s*(s + 1)^2)
fs_part = partfrac(fs)
ft = ilaplace(fs)
