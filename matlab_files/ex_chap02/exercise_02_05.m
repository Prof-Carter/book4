% exercise_02_05.m
% ��� 2.5
% �������������i�d�����܂܂Ȃ��ꍇ�̃w�r�T�C�h�̌����j

clear
format compact

disp(' ')
disp(' ***** ��� 2.5 ***************************')
disp(' ***** �֐� residue �ɂ�镔���������� ****')
s = tf('s');
fs = (6*s + 5)/(s*(s^2 + 4*s + 5))

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)




