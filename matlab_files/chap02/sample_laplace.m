% sample_laplace.m
% ���v���X�ϊ��i�֐� laplace �̎g�p��j

close all

clear
format compact

syms t real

ft = 1 + 2*exp(-t) - 3*exp(-2*t)
fs = laplace(ft)
fs = prod(factor(fs))