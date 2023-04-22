% sample_laplace.m
% ラプラス変換（関数 laplace の使用例）

close all

clear
format compact

syms t real

ft = 1 + 2*exp(-t) - 3*exp(-2*t)
fs = laplace(ft)
fs = prod(factor(fs))