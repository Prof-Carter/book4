% exercise_02_04_sym.m
% ��� 2.4
% �������������i�d�����܂܂Ȃ��ꍇ�j�Ƌt���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real

disp(' ')
disp(' ***** ��� 2.4 ***************************')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (5*s + 8)/(s^2 + 3*s + 2)
ft = ilaplace(fs)

disp(' ')
disp(' ***** ��� 2.4 ***************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� ****')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (5*s + 8)/(s^2 + 3*s + 2)
fs_part = partfrac(fs)
ft = ilaplace(fs_part)





