% example_02_12.m
% �� 2.12 / �� 2.13
% �������������i�d�����܂ޏꍇ�̃w�r�T�C�h�̌����j
clear
format compact

disp(' ')
disp(' ***** �� 2.12 / �� 2.13 ******************')
disp(' ***** �֐� residue �ɂ�镔���������� ****')
s = tf('s');
fs = (2*s + 1)/(s*(s + 1)^2)

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)



