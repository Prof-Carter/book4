% example_02_08_sym.m
% �� 2.8
% �t���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s

disp(' ')
disp(' ***** �� 2.8 ********************')
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))
ft = ilaplace(fs)

