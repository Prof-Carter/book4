% exercise_02_06.m
% ��� 2.6
% �������������i�d�����܂ޏꍇ�̃w�r�T�C�h�̌����j

clear
format compact

disp(' ')
disp(' ***** ��� 2.6 ***************************')
disp(' ***** �֐� residue �ɂ�镔���������� ****')
s = tf('s');
fs = (s + 4)/(s^2 + 4*s + 4)

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)

