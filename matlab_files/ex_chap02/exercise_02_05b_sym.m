% exercise_02_05_sym.m
% ��� 2.5
% �������������i�d�����܂܂Ȃ��ꍇ�j�Ƌt���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real

disp(' ')
disp(' ***** ��� 2.5 ***************************')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (6*s + 5)/(s*(s^2 + 4*s + 5))
ft = ilaplace(fs)

disp(' ')
disp(' ***** ��� 2.5 ***************************')
disp(' ***** �֐� partfrac �ɂ�镔���������� ****')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (6*s + 5)/(s*(s^2 + 4*s + 5))
fs_part = partfrac(fs)
ft = ilaplace(fs_part)




