% sample_ilaplace.m
% 逆ラプラス変換（関数 ilaplace の使用例）

clear
format compact

syms s

fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))
ft = ilaplace(fs)

