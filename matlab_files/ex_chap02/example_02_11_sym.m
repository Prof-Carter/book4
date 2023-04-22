% example_02_11_sym.m
% 例 2.11
% 部分分数分解（複素数を含む場合）と逆ラプラス変換
% 【Symbolic Math Toolbox】

clear
format compact

syms s
syms t real

% -------------------------------------------------------
disp(' ')
disp(' ***** 例 2.11 ***************************')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (2*s + 5)/(s*(s^2 + 2*s + 5))
ft = ilaplace(fs)

% -------------------------------------------------------
disp(' ')
disp(' ***** 例 2.11 ***************************')
disp(' ***** 関数 partfrac による部分分数分解 ****')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (2*s + 5)/(s*(s^2 + 2*s + 5))
fs_part = partfrac(fs)
ft = ilaplace(fs_part)
