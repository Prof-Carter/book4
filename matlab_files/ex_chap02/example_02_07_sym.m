% example_02_07.m
% �� 2.7
% �t���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s

disp(' ')
disp(' ***** �� 2.7 ********************')
fs = 1/s + 2/(s + 1) - 3/(s + 2)
ft = ilaplace(fs)




