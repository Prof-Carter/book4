% example_02_10.m
% �� 2.10
% �������������i�d�����܂܂Ȃ��ꍇ�̃w�r�T�C�h�̌����j
clear
format compact

disp(' ')
disp(' ***** �� 2.10 ****************************')
disp(' ***** �֐� residue �ɂ�镔���������� ****')
s = tf('s');
fs = (2*s + 5)/(s*(s^2 + 2*s + 5))

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)



