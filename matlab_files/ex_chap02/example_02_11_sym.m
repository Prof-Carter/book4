% example_02_11_sym.m
% �� 2.11
% �������������i���f�����܂ޏꍇ�j�Ƌt���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.11 ***************************')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (2*s + 5)/(s*(s^2 + 2*s + 5))
ft = ilaplace(fs)

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.11 ***************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� ****')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (2*s + 5)/(s*(s^2 + 2*s + 5))
fs_part = partfrac(fs)
ft = ilaplace(fs_part)
