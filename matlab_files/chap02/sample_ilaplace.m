% sample_ilaplace.m
% �t���v���X�ϊ��i�֐� ilaplace �̎g�p��j

clear
format compact

syms s

fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))
ft = ilaplace(fs)

