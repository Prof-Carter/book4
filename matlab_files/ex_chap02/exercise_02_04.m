% exercise_02_04.m
% ��� 2.4
% �������������i�d�����܂܂Ȃ��ꍇ�̃w�r�T�C�h�̌����j
% �ySymbolic Math Toolbox�z

clear
format compact

disp(' ')
disp(' ***** ��� 2.4 ***************************')
disp(' ***** �֐� residue �ɂ�镔���������� ****')
s = tf('s');
fs = (5*s + 8)/(s^2 + 3*s + 2)

[num den] =tfdata(fs,'v')

[k p] = residue(num,den)




