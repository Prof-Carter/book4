% example_02_09.m
% �� 2.9
% �������������i�d�����܂܂Ȃ��ꍇ�̃w�r�T�C�h�̌����j
clear
format compact

disp(' ')
disp(' ***** �� 2.9 ****************************')
disp(' ***** �֐� residue �ɂ�镔���������� ****')
s = tf('s');
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)


