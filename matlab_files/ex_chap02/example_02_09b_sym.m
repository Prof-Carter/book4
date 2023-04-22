% example_02_09b_sym.m
% 例 2.9
% 部分分数分解（重解を含まない場合）と逆ラプラス変換
% 【Symbolic Math Toolbox】

clear
format compact

syms s
syms t real

% -------------------------------------------------------
disp(' ')
disp(' ***** 例 2.9 ****************************')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))
ft = ilaplace(fs)

% -------------------------------------------------------
disp(' ')
disp(' ***** 例 2.9 ****************************')
disp(' ***** 関数 partfrac による部分分数分解 ****')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))
fs_part = partfrac(fs)
ft = ilaplace(fs)

