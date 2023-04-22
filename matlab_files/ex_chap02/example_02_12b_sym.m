% example_02_12b_sym.m
% �� 2.12 / �� 2.13
% �������������i�d�����܂ޏꍇ�j�Ƌt���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s

disp(' ')
disp(' ***** �� 2.12 / �� 2.13 ******************')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (2*s + 1)/(s*(s + 1)^2)
ft = ilaplace(fs)

disp(' ')
disp(' ***** �� 2.12 / �� 2.13 ******************')
disp(' ***** �֐� partfrac �ɂ�镔���������� ****')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (2*s + 1)/(s*(s + 1)^2)
fs_part = partfrac(fs)
ft = ilaplace(fs)
