% example_02_09b_sym.m
% �� 2.9
% �������������i�d�����܂܂Ȃ��ꍇ�j�Ƌt���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.9 ****************************')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))
ft = ilaplace(fs)

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.9 ****************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� ****')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))
fs_part = partfrac(fs)
ft = ilaplace(fs)

