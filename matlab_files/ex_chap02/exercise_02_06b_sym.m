% exercise_02_06b_sym.m
% ��� 2.6
% �������������i�d�����܂ޏꍇ�j�Ƌt���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real

disp(' ')
disp(' ***** ��� 2.6 ***************************')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (s + 4)/(s^2 + 4*s + 4)
ft = ilaplace(fs)

disp(' ')
disp(' ***** ��� 2.6 ***************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� ****')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (s + 4)/(s^2 + 4*s + 4)
fs_part = partfrac(fs)
ft = ilaplace(fs_part)


