% example_03_01.m
% �� 3.1
% �ȗ��������t���r�b�c�̈��蔻�ʖ@

disp(' ')
disp(' ***** �� 3.1 ********************')

clear
format compact

sysP = tf([5],[1 3 7 5])
[numP denP] = tfdata(sysP,'v');
hurwitz