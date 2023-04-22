% exercise_07_10.m
% ��� 7.10 (2)
% RLC ��H�̎��g�������i�s�[�N�p���g���Ƌ��U�s�[�N�j

disp(' ')
disp(' ***** ��� 7.10 (2) ********************')

clear
format compact

disp(' ')
disp(' ---- L, C, R ---- ')
L = 200e-3
C = 10e-6
R = 100

disp(' ')
disp(' ---- �ŗL�p���g�� wn�C�����W�� zeta ---- ')
wn   = 1/(L*C)^(1/2)
zeta = (R/2)*sqrt(C/L)

disp(' ')
disp(' ---- �s�[�N�p���g�� wp ---- ')
wp = wn*(1 - 2*zeta^2)^(1/2)

disp(' ')
disp(' ---- ���U�s�[�N Mp ---- ')
Mp = 1/(2*zeta*(- zeta^2 + 1)^(1/2))

