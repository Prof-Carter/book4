% exercise_09_02.m
% ��� 9.2
% �`�B�֐��\�������ԋ�ԕ\���i����W���`�C�ϑ��W���`�j�ւ̕ϊ�

clear
format compact

s = tf('s');

disp(' ')
disp(' ***** ��� 9.2 ********************')

sysP = (5*s + 6)/(s^3 + 2*s^2 + 3*s + 4)

[numP denP] = tfdata(sysP,'v')

[Ac Bc Cc] = ss_ctrb(numP,denP)
[Ao Bo Co] = ss_obsv(numP,denP)

