% exercise_03_03.m
% ��� 3.3
% �ȗ��������t���r�b�c�̈��蔻�ʖ@

% -------------------------------------------------------
clear
format compact

disp(' ')
disp(' ***** ��� 3.3 (1) ********************')
sysP = tf([1 10],[1 1 4 30])
[numP denP] = tfdata(sysP,'v');
disp(' ----�ȗ��������t���r�b�c�̈��蔻�ʖ@ ----')
hurwitz

disp(' ')
disp(' ---- P(s) �̋� ----')
pole(sysP)

% -------------------------------------------------------
clear
format compact

disp(' ')
disp(' ***** ��� 3.3 (2) ********************')
sysP = tf([1 3 2],[1 4 11 14 10])
[numP denP] = tfdata(sysP,'v');
disp(' ----�ȗ��������t���r�b�c�̈��蔻�ʖ@ ----')
hurwitz

disp(' ')
disp(' ---- P(s) �̋� ----')
pole(sysP)
